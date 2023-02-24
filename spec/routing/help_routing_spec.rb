# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HelpController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/help').to route_to('help#index')
    end
  end
end
