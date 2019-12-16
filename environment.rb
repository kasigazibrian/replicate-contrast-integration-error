# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'
require 'dotenv/load'

require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

require_all 'app'
