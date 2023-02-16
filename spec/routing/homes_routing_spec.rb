# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomesController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/homes').to route_to('homes#index')
    end
  end
end
