# frozen_string_literal: true

require 'rails_helper'
RSpec.describe '/cars' do
  include Devise::Test::IntegrationHelpers
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

  describe 'GET /new' do
    let(:user) { create(:user) }

    it 'returns http success' do
      sign_in user

      get '/cars/new'
      expect(response).to have_http_status(:success)
    end
  end
end
