# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Searches' do
  it 'returns http Found for searches GET' do
    get '/searches'
    expect(response).to have_http_status(:found)
  end

  it 'returns http OK for /searches/new GET' do
    get '/searches/new'
    expect(response).to have_http_status(:ok)
  end

  it 'returns http Found for /searches POST' do
    post '/searches'
    expect(response).to have_http_status(:found)
  end
end
