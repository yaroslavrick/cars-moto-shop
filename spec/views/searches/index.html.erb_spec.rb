# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'search/index.html.erb' do
  context 'when user is not logged in' do
    it 'redirects to authentication page'
  end

  context 'when user in logged in' do
    it 'show user searches'
  end
end
