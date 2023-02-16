# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/cars').to route_to('cars#index')
    end

    it 'routes to #show' do
      expect(get: '/cars/1').to route_to('cars#show', id: '1')
    end
  end
end
