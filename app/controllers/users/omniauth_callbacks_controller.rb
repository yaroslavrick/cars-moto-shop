# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      @user = User.from_omniauth(auth_data)

      if @user&.persisted?
        successful_authentication
      else
        failed_authentication
      end
    end

    private

    def successful_authentication
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    end

    def failed_authentication
      session['devise.google_data'] = auth_data.except('extra')
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end

    def auth_data
      request.env['omniauth.auth']
    end
  end
end
