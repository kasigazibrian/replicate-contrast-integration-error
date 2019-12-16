# frozen_string_literal: true

require 'sinatra/base'
# require 'contrast-agent'
require_relative '../helpers/application_helper'

class ApplicationController < Sinatra::Base
  helpers Sinatra::ApplicationHelper
  set :environment, :test if ENV["RACK_ENV"] == "test"
  set :environment, :development if ENV["RACK_ENV"] == "development"

  configure :test do
    use Contrast::Agent::Middleware, true
  end

  not_found do
    json(error: 'Route does not exist')
  end
end
