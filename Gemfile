# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.6.3'

source 'https://app.contrastsecurity.com/Contrast/api/repo/rvm' do
  group :contrast, :development, :test, :production do
    gem 'contrast-agent'
  end
end

gem 'activerecord', require: 'active_record'
gem 'bcrypt'
gem 'pry'
gem 'rake'
gem 'require_all', '~> 1.5.0'
gem 'rubocop'
gem 'shotgun'
gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-activerecord', require: 'sinatra/activerecord'
gem 'sinatra-contrib'
gem 'sinatra-static-assets'
gem 'sqlite3'

group :test do
  gem 'capybara'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
  gem 'dotenv'
  gem 'factory_bot'
  gem 'faker'
  gem 'rack-test', require: 'rack/test'
  gem 'rack_session_access'
  gem 'rspec'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end
