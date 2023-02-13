# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Helps' do
  describe 'GET /index' do
    it 'returns http success' do
      get '/helps'
      expect(response).to have_http_status(:success)
    end
  end
end
