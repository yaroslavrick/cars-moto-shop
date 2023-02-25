# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsService::SortService, type: :service do
  describe '#call' do
    subject(:cars) { described_class.new(params:, data: Car.all).call }

    let(:car1) { create(:car, :zaz_sens) }
    let(:car2) { create(:car, :opel_kadett) }
    let(:car3) { create(:car, :nissan_leaf) }

    context 'when sorting by created_at ASC' do
      let(:params) { { 'created_at' => 'ASC' } }

      it 'returns sorted data' do
        expect(cars).to eq([car1, car2, car3])
      end
    end

    context 'when sorting by created_at DESC' do
      let(:params) { { 'created_at' => 'DESC' } }

      it 'returns sorted data' do
        expect(cars).to eq([car1, car2, car3].reverse)
      end
    end

    context 'when sorting by price ASC' do
      let(:params) { { 'price' => 'ASC' } }

      it 'returns sorted data' do
        expect(cars).to eq([car2, car1, car3])
      end
    end

    context 'when sorting by price DESC' do
      let(:params) { { 'price' => 'DESC' } }

      it 'returns sorted data' do
        expect(cars).to eq([car2, car1, car3].reverse)
      end
    end
  end
end
