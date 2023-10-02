# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  # include Internationalization
  skip_before_action :verify_authenticity_token
end
