# frozen_string_literal: true

require_relative './application_controller'
require 'sinatra/json'

class PostsController < ApplicationController
  post '/v1/posts' do
    unless params.present? && params['body'].present? && params['title'].present?
      halt 400
    end
    body = params['body']
    title = params['title']

    post = Post.new
    post.title = title
    post.body = body
    if post.save
      status 201
      json(message: 'Post created successfully', post: post_object(post))
    else
      status 400
      json(error: post.errors.full_messages.first)
    end
  end

  get '/v1/posts' do
    posts = Post.all
    json posts.map(&method(:post_object))
  end

  get '/v1/posts/:id' do
    post = Post.find_by(id: params[:id])
    json post_object(post)
  end

  put '/v1/posts/:id' do
    post = Post.find_by(id: params[:id])
    if post.update(params.slice(:body, :title))
      status 200
      json(message: 'Post updated successfully', post: post_object(post))
    else
      status 400
      json(error: post.errors.full_messages.first)
    end
  end
end
