# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/cars' do
  describe 'GET /index' do
    it 'returns http success' do
      get '/cars'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let!(:car) { create(:car) }

    it 'returns http success' do
      get "/cars/#{car.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
