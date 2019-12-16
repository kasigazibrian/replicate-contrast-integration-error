# frozen_string_literal: true

require_relative './environment'
require 'contrast-agent'
require 'sinatra/activerecord/rake'
require './app/controllers/application_controller'

Dir.glob('lib/tasks/*.rake').each { |task| load task }

begin
  load 'contrast/tasks/service.rb'
rescue LoadError
end

task :console do
  Pry.start
end
