# frozen_string_literal: true

require_relative '../spec_helper.rb'

RSpec.describe ApplicationController, type: :controller do
  let(:json_response) { JSON.parse(last_response.body) }

  it 'should return a message when route does not exist' do
    get '/unknown_route'

    expect(last_response).to be_not_found
    expect(json_response['error']).to eq('Route does not exist')
  end
end
