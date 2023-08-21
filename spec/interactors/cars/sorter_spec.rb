# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cars::Sorter, type: :service do
  describe '.call' do
    subject(:context) { described_class.call(params:, cars: Car.all) }

    let(:zaz_sens) { create(:car, :zaz_sens) }
    let(:opel_kadett) { create(:car, :opel_kadett) }
    let(:nissan_leaf) { create(:car, :nissan_leaf) }

    context 'when sorting by created_at ASC' do
      let(:params) { { 'created_at' => 'ASC' } }

      it 'returns sorted data' do
        expect(context.cars).to eq([zaz_sens, opel_kadett, nissan_leaf])
      end
    end

    context 'when sorting by created_at DESC' do
      let(:params) { { 'created_at' => 'DESC' } }

      it 'returns sorted data' do
        expect(context.cars).to eq([zaz_sens, opel_kadett, nissan_leaf].reverse)
      end
    end

    context 'when sorting by price ASC' do
      let(:params) { { 'price' => 'ASC' } }

      it 'returns sorted data' do
        expect(context.cars).to eq([opel_kadett, zaz_sens, nissan_leaf])
      end
    end

    context 'when sorting by price DESC' do
      let(:params) { { 'price' => 'DESC' } }

      it 'returns sorted data' do
        expect(context.cars).to eq([opel_kadett, zaz_sens, nissan_leaf].reverse)
      end
    end
  end
end
