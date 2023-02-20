# frozen_string_literal: true

module ControllerMacros
  def login_user
    before do
      @request.env['device.mapping'] = Devise.mappings[:user]
      user = create(:user)
      sign_in user
    end
  end
end
