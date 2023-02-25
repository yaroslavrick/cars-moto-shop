# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchesController do
  let(:user) { create(:user) }
  let(:search) { create(:search, :search_zaz_sens) }

  describe 'GET #index' do
    context 'when user logged' do
      before do
        sign_in user
        get :index
      end

      it 'return 200:OK' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when user is not logged in' do
      before do
        get :index, params: { locale: I18n.default_locale }
      end

      it 'redirects to sign_up page' do
        expect(response).to redirect_to(new_user_session_path(locale: I18n.default_locale))
      end
    end
  end

  describe 'POST #create' do
    context 'when user is logged in' do
      it 'creates new search' do
        expect do
          post :create,
               params: { filter_params: search }
        end.to change(Search, :count).by(1)
      end

      it 'redirects to cars_path' do
        post :create, params: { filter_params: search }
        expect(response).to redirect_to(cars_path)
      end
    end
  end
end
