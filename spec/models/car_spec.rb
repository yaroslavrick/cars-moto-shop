# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car do
  let(:car) { build(:car) }

  context 'when presence validation' do
    it 'is valid with valid attributes' do
      expect(car).to be_valid
    end

    it 'is not valid without a make' do
      car.make = nil
      expect(car).not_to be_valid
    end

    it 'is not valid without a model' do
      car.model = nil
      expect(car).not_to be_valid
    end

    it 'is not valid without a year' do
      car.year = nil
      expect(car).not_to be_valid
    end

    it 'is not valid without a odometer' do
      car.odometer = nil
      expect(car).not_to be_valid
    end

    it 'is not valid without a price' do
      car.price = nil
      expect(car).not_to be_valid
    end

    it 'is not valid without a description' do
      car.description = nil
      expect(car).not_to be_valid
    end
  end

  context 'when validation types' do
    it 'not valid make length with non valid length' do
      car.make = 'A'
      expect(car).not_to be_valid
    end

    it 'validate make length with valid length' do
      car.make = 'Ab'
      expect(car).to be_valid
    end

    it 'not valid with year non integer value' do
      car.year = ''
      expect(car).not_to be_valid
    end

    it 'validate year numericality with valid value' do
      car.year = 1951
      expect(car).to be_valid
    end

    it 'validate year greater than 1900' do
      car.year = 1901
      expect(car).to be_valid
    end

    it 'not valid with year less than 1900' do
      car.year = 1899
      expect(car).not_to be_valid
    end

    it 'not valid odometer numericality with non integer value' do
      car.odometer = ''
      expect(car).not_to be_valid
    end

    it 'validate odometer numericality' do
      car.odometer = 80_000
      expect(car).to be_valid
    end

    it 'not validate price with non numeric value' do
      car.price = ''
      expect(car).not_to be_valid
    end

    it 'validate price numericality' do
      car.price = 9.99
      expect(car).to be_valid
    end

    it 'not validate price equal 0' do
      car.price = 0
      expect(car).not_to be_valid
    end

    it 'validate price greater than 0' do
      car.price = 0.5
      expect(car).to be_valid
    end

    it 'not validate description with length less than 6 symbols' do
      car.description = '12345'
      expect(car).not_to be_valid
    end

    it 'not validate description with length more than 300 symbols' do
      car.description = FFaker::Lorem.characters(301)
      expect(car).not_to be_valid
    end

    it 'validate description length' do
      car.description = FFaker::Lorem.characters(300)
      expect(car).to be_valid
    end
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:make) }
    it { is_expected.to have_db_column(:model) }
    it { is_expected.to have_db_column(:year) }
    it { is_expected.to have_db_column(:odometer) }
    it { is_expected.to have_db_column(:price) }
    it { is_expected.to have_db_column(:description) }
  end

  describe 'error message' do
    it 'returns proper error message for make' do
      car.make = 'A'
      car.valid?
      expect(car.errors[:make]).to include('2 characters is the minimum allowed')
    end

    it 'returns proper error message for description min length' do
      car.description = 'Abcde'
      car.valid?
      expect(car.errors[:description]).to include('6 characters is the minimum allowed')
    end

    it 'returns proper error message for description max length' do
      car.description = FFaker::Lorem.characters(301)
      car.valid?
      expect(car.errors[:description]).to include('300 characters is the maximum allowed')
    end
  end

  describe 'scopes' do
    let!(:car1) do
      create(:car, :opel_kadett)
    end
    let!(:car2) do
      create(:car, :honda_civic)
    end
    let!(:car3) do
      create(:car, :toyota_corolla)
    end
    let!(:car4) do
      create(:car, :zaz_sens)
    end

    context 'when filter by make' do
      it 'returns car with the specific make' do
        expect(described_class.filter_by_make('Opel')).to match_array([car1])
      end
    end

    context 'when filter by model' do
      it 'returns car with the specific model' do
        expect(described_class.filter_by_model('Civic')).to match_array([car2])
      end
    end

    context 'when filter by year from' do
      it 'returns car with the specific year from' do
        expect(described_class.filter_by_year_from(2004)).to match_array([car3, car4])
      end
    end

    context 'when filter by year to' do
      it 'returns car with the specific year to' do
        expect(described_class.filter_by_year_to(2002)).to match_array([car1, car2])
      end
    end

    context 'when filter by price from' do
      it 'returns car with the specific price to' do
        expect(described_class.filter_by_price_from(1000)).to match_array([car2, car3, car4])
      end
    end

    context 'when filter by price to' do
      it 'returns car with the specific price to' do
        expect(described_class.filter_by_price_to(1000)).to match_array([car1, car2])
      end
    end

    context 'when filter sort by' do
      it 'return cars sorted by price ASC' do
        expect(described_class.filter_sort_by('price ASC')).to eq([car1, car2, car4, car3])
      end

      it 'return cars sorted by price DESC' do
        expect(described_class.filter_sort_by('price DESC')).to eq([car1, car2, car4, car3].reverse)
      end

      it 'return cars sorted by created_at ASC' do
        expect(described_class.filter_sort_by('created_at ASC')).to eq([car1, car2, car3, car4])
      end

      it 'return cars sorted by created_at DESC' do
        expect(described_class.filter_sort_by('created_at DESC')).to eq([car1, car2, car3, car4].reverse)
      end
    end
  end
end
