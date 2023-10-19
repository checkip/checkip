current_path = ENV.fetch('CHECKIP_CURRENT_PATH') { '/var/www/checkip/current' }
shared_path  = ENV.fetch('CHECKIP_SHARED_PATH') { '/var/www/checkip/shared' }

directory current_path.to_s
rackup "#{current_path}/config.ru"
environment ENV.fetch('RAILS_ENV') { 'production' }

pidfile ENV.fetch("PIDFILE") { "#{shared_path}/tmp/pids/puma.pid" }
state_path "#{shared_path}/tmp/pids/puma.state"
stdout_redirect "#{shared_path}/log/puma_access.log", "#{shared_path}/log/puma_error.log", true

max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

bind "unix://#{shared_path}/tmp/sockets/puma.sock"

on_restart do
  puts 'Refreshing Gemfile'
  ENV['BUNDLE_GEMFILE'] = ''
end

# Specifies that the worker count should equal the number of processors in production.
if ENV["RAILS_ENV"] == "production"
  require "concurrent-ruby"
  worker_count = Integer(ENV.fetch("WEB_CONCURRENCY") { Concurrent.physical_processor_count })
  workers worker_count if worker_count > 1
end

prune_bundler

tag 'checkip'

plugin :tmp_restart
