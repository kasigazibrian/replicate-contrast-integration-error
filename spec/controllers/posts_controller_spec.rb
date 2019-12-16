# frozen_string_literal: true

require_relative '../spec_helper.rb'

RSpec.describe PostsController, type: :controller do
  let(:post_params) { attributes_for(:post) }
  let(:json_response) { JSON.parse(last_response.body) }

  describe 'post' do
    it 'should require body and title' do
      post_params[:title] = nil
      binding.pry
      post '/v1/posts', post_params, 'Content-Type' => 'Application/json'

      expect(last_response).to be_bad_request
    end

    it 'should allow creating a new post' do
      post '/v1/posts', post_params, 'Content-Type' => 'Application/json'

      expect(last_response).to be_created
      expect(json_response['message']).to eq('Post created successfully')
    end
  end

  describe '#get' do
    it 'should allow fetching all posts' do
      post '/v1/posts', post_params, 'Content-Type' => 'Application/json'

      get '/v1/posts'
      expect(last_response).to be_ok
      expect(json_response[0]['body']).to eq(post_params[:body])
    end

    it 'should allow fetching a single post' do
      test_post_object = create :post
      get "/v1/posts/#{test_post_object.id}"
      expect(last_response).to be_ok
      expect(json_response['body']).to eq(test_post_object.body)
    end
  end

  describe '#put' do
    it 'should allow updating a post' do
      test_post_object = create :post
      put "/v1/posts/#{test_post_object.id}", body: 'This is a new body'
      expect(last_response).to be_ok
      expect(json_response['post']['body']).to eq('This is a new body')
    end
  end
end
