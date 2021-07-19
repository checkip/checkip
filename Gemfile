source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Core
gem 'rails', '~> 6.1.0'

# System
gem 'actionpack-cloudflare', '~> 1.1'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'down', '~> 5.2', require: false
gem 'jbuilder', '>= 2.7'
gem 'maxminddb', '~> 0.1'
gem 'meta-rails', '~> 2.0'
gem 'puma', '~> 5.1'
gem 'rouge', '~> 3.26'
gem 'webpacker', '~> 5.2'

group :development do
  gem 'capistrano', '3.16.0'
  gem 'capistrano-maintenance', '1.2.1', require: false
  gem 'capistrano-rails', '1.6.1', require: false
  gem 'capistrano-rvm', '0.1.2', require: false
  gem 'i18n-tasks'
  gem 'pry-rails'
  gem 'rack-mini-profiler'
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
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
