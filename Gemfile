source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Core
gem 'rails', '~> 6.1.0'

# System
gem 'bootsnap', '>= 1.4.4', require: false
gem 'jbuilder', '>= 2.7'
gem 'puma', '~> 5.1'
gem 'webpacker', '~> 5.2'

group :development, :test do
  gem 'byebug'
  gem 'dotenv-rails'
end

group :development do
  gem 'rack-mini-profiler'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'web-console'
end
