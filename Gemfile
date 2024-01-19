source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.0'

# Core
gem 'activemodel', '~> 7.1.1'

# System
gem 'bootsnap', '>= 1.10.2', require: false
gem 'jsbundling-rails', '~> 1.0'
gem 'propshaft', '~> 0.6'
gem 'puma', '~> 6.0'
gem 'sd_notify', '~> 0.1.1', require: false

# Logs
gem 'lograge', '~> 0.14'

# Other
gem 'down', '~> 5.2', require: false
gem 'maxmind-db', '~> 1.1'
gem 'meta-rails', '~> 2.0'
gem 'rouge', '~> 4.0'

# Monitoring
gem 'elastic-apm', '~> 4.5'

group :development do
  gem 'bcrypt_pbkdf'
  gem 'capistrano', '3.18.0'
  gem 'capistrano-maintenance', '1.2.1', require: false
  gem 'capistrano-rails', '1.6.3', require: false
  gem 'capistrano-rvm', '0.1.2', require: false
  gem 'ed25519'
  gem 'i18n-tasks'
  gem 'net-ssh', require: 'net/ssh'
  gem 'pry-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'web-console'
end

group :development, :test do
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'fuubar'
  gem 'rspec-rails'
end

group :test do
  gem 'simplecov', require: false
end
