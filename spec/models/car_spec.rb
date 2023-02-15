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
end
