# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Searches' do
  describe 'GET /index' do
    # it 'returns http success if user is not logged in' do
    #   get '/searches'
    #   expect(response).to have_http_status(:success)
    # end

    it 'returns http Found if user is logged in' do
      get '/searches'
      expect(response).to have_http_status(:found)
    end
  end
end
