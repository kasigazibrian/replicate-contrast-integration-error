# frozen_string_literal: true

require_relative './application_controller'

class LikesController < ApplicationController

  get '/v1/posts/:id/likes' do
    post = Post.find_by(id: params[:id])
    halt 404 unless post
    json(likes: post.likes.count)
  end

  post '/v1/posts/:id/likes' do
    post = Post.find_by(id: params[:id])
    halt 404 unless post
    if post.likes.create
      json({ message: 'Liked!' })
    else
      halt 400
    end
  end


  get '/v1/comments/:id/likes' do
    comment = Comment.find_by(id: params[:id])
    halt 404 unless comment
    json(likes: comment.likes.count)
  end

  post '/v1/comments/:id/likes' do
    comment = Comment.find_by(id: params[:id])
    halt 404 unless comment
    if comment.likes.create
      json({ message: 'Liked!' })
    else
      halt 400
    end
  end
end