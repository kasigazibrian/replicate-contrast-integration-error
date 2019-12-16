# frozen_string_literal: true

require_relative '../spec_helper.rb'

RSpec.describe CommentsController, type: :controller do
  let(:comment_params) { attributes_for(:comment) }
  let(:json_response) { JSON.parse(last_response.body) }
  let(:post_object) { create :post }

  context '#post' do
    it 'should require body' do
      comment_params[:body] = nil
      post "/v1/posts/#{post_object.id}/comments", comment_params,
           'Content-Type' => 'Application/json'

      expect(last_response).to be_bad_request
    end

    it 'should allow creating a new comment' do
      post "/v1/posts/#{post_object.id}/comments", comment_params,
           'Content-Type' => 'Application/json'

      expect(last_response).to be_created
      expect(json_response['message']).to eq('Comment created successfully')
    end
  end

  describe '#get' do
    it 'should allow fetching all comments' do
      post "/v1/posts/#{post_object.id}/comments", comment_params,
           'Content-Type' => 'Application/json'

      get "/v1/posts/#{post_object.id}/comments"
      expect(last_response).to be_ok
      expect(json_response[0]['body']).to eq(comment_params[:body])
    end

    it 'should allow fetching a single comment' do
      comment = create :comment, post: post_object
      get "/v1/posts/#{post_object.id}/comments/#{comment.id}", comment_params,
           'Content-Type' => 'Application/json'
      expect(last_response).to be_ok
      expect(json_response['body']).to eq(comment.body)
    end
  end

  describe '#put' do
    it 'should allow updating a comment' do
      comment = create :comment, post: post_object
      put "/v1/posts/#{post_object.id}/comments/#{comment.id}",
          body: 'This is the new body', 'Content-Type' => 'Application/json'
      expect(last_response).to be_ok
      expect(json_response['comment']['body']).to eq('This is the new body')
    end
  end
end
