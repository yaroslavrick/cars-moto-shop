# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchesController do
  let(:user) { create(:user) }

  describe 'GET #index' do
    context 'when user logged' do
      before do
        sign_in user
        get :index
      end

      it 'return 200:OK' do
        get :index
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
end
