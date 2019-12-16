# frozen_string_literal: true

require_relative './application_controller'

class CommentsController < ApplicationController
  before '/v1/posts/:id/*' do
    @post = Post.find_by(id: params[:id])
    halt 404 unless @post.present?
  end

  post '/v1/posts/:id/comments' do
    halt 400 unless params[:body].present?

    comment = Comment.new
    comment.body = params[:body]
    comment.post = @post
    if comment.save
      status 201
      json(message: 'Comment created successfully',
           comment: comment_object(comment))
    else
      status 400
      json(error: comment.errors.full_messages.first)
    end
  end

  get '/v1/posts/:id/comments' do
    comments = @post.comments
    json comments.map(&method(:comment_object))
  end

  get '/v1/posts/:id/comments/:comment_id' do
    comment = Comment.find_by(id: params[:comment_id])
    halt 200, {} unless comment.present?
    json comment_object(comment)
  end

  put '/v1/posts/:id/comments/:comment_id' do
    comment = Comment.find_by(id: params[:comment_id])
    halt 404 unless comment.present?
    if comment.update(params.slice(:body, :title))
      status 200
      json(message: 'Comment updated successfully', comment: comment_object(comment))
    else
      status 400
      json(error: comment.errors.full_messages.first)
    end
  end
end
