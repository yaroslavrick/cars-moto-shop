# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsService::SearchService, type: :service do
  describe '#call' do
    subject(:cars) { described_class.new(params:, data: Car.all).call }

    let!(:car1) { create(:car, :nissan_leaf) }
    let!(:car2) { create(:car, :zaz_sens) }
    let!(:car3) { create(:car, :opel_kadett) }

    context 'when filtering by all proper params' do
      let(:params) do
        { 'make' => 'Zaz', 'model' => 'Sens', 'year_from' => '2013', 'year_to' => '2013',
          'price_from' => '3000', 'price_to' => '3000' }
      end

      it 'returns filtered data' do
        expect(cars.first).to eq(car2)
      end
    end

    context 'when filtering by make' do
      let(:params) { { 'make' => 'Zaz' } }

      it 'returns filtered data' do
        expect(cars.first).to eq(car2)
      end
    end

    context 'when filtering by model' do
      let(:params) { { 'model' => 'Leaf' } }

      it 'returns filtered data' do
        expect(cars.first.model).to eq('Leaf')
      end
    end

    context 'when filtering by year from and year to' do
      let(:params) { { 'year_from' => 1985, 'year_to' => 2012 } }

      it 'returns filtered data' do
        expect(cars).to include(car1, car3)
      end
    end

    context 'when filtering by year from' do
      let(:params) { { 'year_from' => '2013' } }

      it 'returns filtered data' do
        expect(cars).to include(car2)
      end
    end

    context 'when filtering by year to' do
      let(:params) { { 'year_to' => '2012' } }

      it 'returns filtered data' do
        expect(cars).to include(car1, car3)
      end
    end

    context 'when filtering by price from and price to' do
      let(:params) { { 'price_from' => 3000, 'price_to' => 15_000 } }

      it 'returns filtered data' do
        expect(cars).to include(car1, car2)
      end
    end

    context 'when filtering by price from' do
      let(:params) { { 'price_from' => 10_000 } }

      it 'returns filtered data' do
        expect(cars).to include(car1)
      end
    end

    context 'when filtering by price to' do
      let(:params) { { 'price_to' => 10_000 } }

      it 'returns filtered data' do
        expect(cars).to include(car2, car3)
      end
    end
  end
end
