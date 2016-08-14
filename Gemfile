# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.0.0'
gem 'pg'
gem 'puma'

gem 'rack-canonical-host'
gem 'recipient_interceptor'

# Views
gem 'autoprefixer-rails'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'

# JS
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'uglifier'

# Jobs
gem 'sidekiq'
gem 'redis'

# Users
gem 'clearance'

# Tagging
gem 'acts-as-taggable-on'

# Links
gem 'link_thumbnailer'
gem 'httparty'
gem 'will_paginate'

# Validations
gem 'validate_url'

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'
end

group :development, :test do
  gem 'awesome_print'
  gem 'bullet'
  gem 'bundler-audit', require: false
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'psych', require: false # for faker
end

group :development, :staging do
  gem 'rack-mini-profiler', require: false
end

group :test do
  gem 'capybara-webkit'
  gem 'codecov', require: false
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'webmock'
  gem 'vcr'
end

group :staging, :production do
  gem 'rack-timeout'
  gem 'rails_12factor'
  gem 'rails_stdout_logging'
end
