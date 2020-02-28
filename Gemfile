# frozen_string_literal: true

source "https://rubygems.org"
ruby "2.5.1"

gem "webpacker", "~> 3.5"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.1.2"
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use Puma as the app server
gem "puma", "~> 3.12"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# See https://github.com/rails/execjs#readme for more supported runtimes
gem "therubyracer", platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem "devise"
gem 'omniauth-google-oauth2'
gem 'google-api-client'

gem "gemoji"
gem "json"
gem "kaminari"
gem "pg"
gem "thor"
gem "twitter-bootstrap-rails"
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "bootstrap_form"
# gem "festivals_lab"
gem "festivals_lab", git: "https://github.com/singhprd/festivals_lab", branch: "fix-get-single-event-by-uuid"
# gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
# gem 'sqlite3'
# gem 'mini_racer', platforms: :ruby
# gem 'libv8', "~> 5.0"
gem "acts_as_list"
gem "font-awesome-rails"
gem "ruby-readability", require: "readability"
gem "serviceworker-rails"
# gem 'mini_racer', platforms: :ruby

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug"
  gem "factory_bot_rails"
  gem "guard" # NOTE: this is necessary in newer versions
  # gem 'guard-livereload'
  # gem 'guard-minitest'
  gem "pry"
  # gem 'rack-livereload'
  # gem 'sqlite3'
  gem "fabrication"
  gem "faker", "~> 1.7", ">= 1.7.3"
end

group :test do
  gem "capybara"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "listen"
  gem "web-console"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "letter_opener"
  # gem 'meta_request'
  gem "rubocop", "~> 0.65.0", require: false
  gem "rufo"
  gem "spring"
  gem "spring-watcher-listen"
end

gem "capistrano", "~> 3.7", ">= 3.7.1"
gem "capistrano-passenger", "~> 0.2.0"
gem "capistrano-rails", "~> 1.2"
gem "capistrano-rbenv", "~> 2.1"
gem "mailgun-ruby", "~>1.1.6"
gem "webauthn", "~> 1.13.0"
gem 'devise_invitable', '~> 2.0.0'
gem 'premailer-rails'
