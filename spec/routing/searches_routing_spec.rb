# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/searches').to route_to('searches#index')
    end

    it 'routes to #create via POST' do
      expect(post: '/searches').to route_to('searches#create')
    end

    it 'routes to #new' do
      expect(get: '/searches/new').to route_to('searches#new')
    end
  end
end
