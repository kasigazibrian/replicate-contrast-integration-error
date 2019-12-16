# frozen_string_literal: true

require_relative '../spec_helper.rb'

RSpec.describe LikesController, type: :controller do
  let(:json_response) { JSON.parse(last_response.body ) }
  context 'For Post model' do
    let(:post_object) { create(:post) }
    context '#post' do
      it 'returns 404 if post does not exist' do
        post '/v1/posts/invalid_id/likes', {},
             'Content-Type' => 'Application/json'

        expect(last_response).to be_not_found
      end
      it 'should create a new like' do
        post "/v1/posts/#{post_object.id}/likes", {},
             'Content-Type' => 'Application/json'

        expect(last_response).to be_ok
        expect(json_response['message']).to eq('Liked!')
      end
    end

    context '#get' do
      it 'returns 404 if post does not exist' do
        get '/v1/posts/invalid_id/likes', {},
            'Content-Type' => 'Application/json'

        expect(last_response).to be_not_found
      end

      it 'should return the likes count for the post' do
        get "/v1/posts/#{post_object.id}/likes", {},
             'Content-Type' => 'Application/json'

        expect(last_response).to be_ok
        expect(json_response['likes']).not_to be_nil
      end
    end
  end

  # context 'For Comment model' do
  #   context '#post' do
  #     it 'should require body' do
  #       post "/v1/posts/#{post_object.id}/comments", comment_params,
  #            'Content-Type' => 'Application/json'
  #
  #       expect(last_response).to be_bad_request
  #     end
  #
  #     it 'should allow creating a new comment' do
  #       post "/v1/posts/#{post_object.id}/comments", comment_params,
  #            'Content-Type' => 'Application/json'
  #
  #       expect(last_response).to be_created
  #       expect(json_response['message']).to eq('Comment created successfully')
  #     end
  #   end
  # end
end