# frozen_string_literal: true

require_relative './environment'
require './app/controllers/application_controller'
require './app/controllers/posts_controller'
require './app/controllers/comments_controller'
require './app/controllers/likes_controller'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use PostsController
use CommentsController
use LikesController
run ApplicationController
