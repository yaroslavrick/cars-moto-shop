# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsService::SearchService, type: :model do
  let(:search) { build(:search) }
  let(:cars) { create_list(:car, 49) + [create(:car, :ford)] }

  context 'when searching a car' do
    it 'will return proper car' do
      search_service = described_class.new(params: search, data: cars).call
      expect(search_service.first.make).to eq('Ford')
    end

    it 'will return empty if car does not exist' do
      search.make = 'Wrong_input'

      search_service = described_class.new(params: search, data: cars).call
      expect(search_service).to be_blank
    end
  end
end
