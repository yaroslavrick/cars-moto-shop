# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car do
  let(:car) { build(:car) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:make) }
    it { is_expected.to have_db_column(:model) }
    it { is_expected.to have_db_column(:year) }
    it { is_expected.to have_db_column(:odometer) }
    it { is_expected.to have_db_column(:price) }
    it { is_expected.to have_db_column(:description) }
    it { is_expected.to have_db_column(:created_at) }
    it { is_expected.to have_db_column(:updated_at) }
    it { is_expected.to have_db_column(:user_id) }
  end

  context 'when presence validation' do
    it 'is valid with valid attributes' do
      expect(car).to be_valid
    end

    it 'is not valid without a make' do
      car.make = nil
      expect(car).not_to be_valid
    end

    it 'is return error when without a make field' do
      car.make = nil
      car.valid?
      expect(car.errors[:make]).to eq([
        "can't be blank", "#{described_class::MAKE_FIELD_MINIMUM_LENGTH} characters is the minimum allowed"
      ])
    end

    it 'is not valid without a model' do
      car.model = nil
      expect(car).not_to be_valid
    end

    it 'is return error when without a model field' do
      car.model = nil
      car.valid?
      expect(car.errors[:model]).to eq(["can't be blank"])
    end

    it 'is not valid without a year' do
      car.year = nil
      expect(car).not_to be_valid
    end

    it 'is return error when without a year field' do
      car.year = nil
      car.valid?
      expect(car.errors[:year]).to eq(["can't be blank", 'is not a number'])
    end

    it 'is not valid without a odometer' do
      car.odometer = nil
      expect(car).not_to be_valid
    end

    it 'is return error when without an odometer field' do
      car.odometer = nil
      car.valid?
      expect(car.errors[:odometer]).to eq(["can't be blank", 'is not a number'])
    end

    it 'is not valid without a price' do
      car.price = nil
      expect(car).not_to be_valid
    end

    it 'is return error when without a price field' do
      car.price = nil
      car.valid?
      expect(car.errors[:price]).to eq(["can't be blank", 'is not a number'])
    end

    it 'is not valid without a description' do
      car.description = nil
      expect(car).not_to be_valid
    end

    it 'is return error when without a description field' do
      car.description = nil
      car.valid?
      expect(car.errors[:description]).to include("can't be blank")
    end
  end

  context 'when validation types' do
    it 'not valid make length with non valid length' do
      expect(build(:car, make: 'a' * (described_class::MAKE_FIELD_MINIMUM_LENGTH - 1))).not_to be_valid
    end

    it 'returns proper error message for make' do
      car.make = 'a' * (described_class::MAKE_FIELD_MINIMUM_LENGTH - 1)
      car.valid?

      expect(car.errors[:make]).to include(
        "#{described_class::MAKE_FIELD_MINIMUM_LENGTH} characters is the minimum allowed"
      )
    end

    it 'validate make length with valid length' do
      expect(build(:car, make: 'a' * described_class::MAKE_FIELD_MINIMUM_LENGTH)).to be_valid
    end

    it 'not valid with year non integer value' do
      car.year = ''
      expect(car).not_to be_valid
    end

    it 'returns error with year non integer value' do
      car.year = ''
      car.valid?
      expect(car.errors[:year]).to include('is not a number')
    end

    it 'validate year greater than YEAR_FIELD_GREATER_THEN' do
      expect(build(:car, year: described_class::YEAR_FIELD_GREATER_THEN + 1)).to be_valid
    end

    it 'not valid with year equal YEAR_FIELD_GREATER_THEN' do
      expect(build(:car, year: described_class::YEAR_FIELD_GREATER_THEN)).not_to be_valid
    end

    it 'returns error with year equal YEAR_FIELD_GREATER_THEN' do
      car.year = described_class::YEAR_FIELD_GREATER_THEN
      car.valid?
      expect(car.errors[:year]).to include("must be greater than #{described_class::YEAR_FIELD_GREATER_THEN}")
    end

    it 'not valid odometer numericality with non integer value' do
      car.odometer = ''
      expect(car).not_to be_valid
    end

    it 'returns error when odometer numericality with non integer value' do
      car.odometer = ''
      car.valid?
      expect(car.errors[:odometer]).to include('is not a number')
    end

    it 'validate odometer with ODOMETER_FIELD_MINIMUM_NUM value' do
      expect(build(:car, odometer: described_class::ODOMETER_FIELD_MINIMUM_NUM)).to be_valid
    end

    it 'not valid odometer with less then ODOMETER_FIELD_MINIMUM_NUM value' do
      expect(build(:car, odometer: described_class::ODOMETER_FIELD_MINIMUM_NUM - 1)).not_to be_valid
    end

    it 'return error when odometer with less then ODOMETER_FIELD_MINIMUM_NUM value' do
      car.odometer = (described_class::ODOMETER_FIELD_MINIMUM_NUM - 1)
      car.valid?
      expect(car.errors[:odometer]).to include(
        "must be greater than or equal to #{described_class::ODOMETER_FIELD_MINIMUM_NUM}"
      )
    end

    it 'not validate price with non numeric value' do
      car.price = ''
      expect(car).not_to be_valid
    end

    it 'returns error when price with non numeric value' do
      car.price = ''
      car.valid?
      expect(car.errors[:price]).to include('is not a number')
    end

    it 'not validate price equal PRICE_FIELD_GREATER_THEN value' do
      expect(build(:car, price: described_class::PRICE_FIELD_GREATER_THEN)).not_to be_valid
    end

    it 'returns error when price equal PRICE_FIELD_GREATER_THEN value' do
      car.price = described_class::PRICE_FIELD_GREATER_THEN
      car.valid?
      expect(car.errors[:price]).to include("must be greater than #{described_class::PRICE_FIELD_GREATER_THEN}")
    end

    it 'validate price greater than PRICE_FIELD_GREATER_THEN value' do
      expect(build(:car, price: described_class::PRICE_FIELD_GREATER_THEN + 1)).to be_valid
    end

    it 'not validate description with empty string' do
      expect(build(:car, description: '')).not_to be_valid
    end

    it 'returns error when description with empty string' do
      car.description = ''
      car.valid?
      expect(car.errors[:description]).to include(
        "#{described_class::DESCRIPTION_FIELD_MIN_LENGTH} characters is the minimum allowed"
      )
    end

    it 'not validate description with length more than DESCRIPTION_FIELD_MAX_LENGTH symbols' do
      expect(build(:car, description: 'a' * (described_class::DESCRIPTION_FIELD_MAX_LENGTH + 1))).not_to be_valid
    end

    it 'returns error when description with length more than DESCRIPTION_FIELD_MAX_LENGTH symbols' do
      car.description = 'a' * (described_class::DESCRIPTION_FIELD_MAX_LENGTH + 1)
      car.valid?
      expect(car.errors[:description]).to include(
        "#{described_class::DESCRIPTION_FIELD_MAX_LENGTH} characters is the maximum allowed"
      )
    end

    it 'validate description length with DESCRIPTION_FIELD_MIN_LENGTH symbols' do
      expect(build(:car, description: 'a' * described_class::DESCRIPTION_FIELD_MIN_LENGTH)).to be_valid
    end

    it 'validate description length with DESCRIPTION_FIELD_MAX_LENGTH symbols' do
      expect(build(:car, description: 'a' * described_class::DESCRIPTION_FIELD_MAX_LENGTH)).to be_valid
    end

    it 'is return error when description has less than DESCRIPTION_FIELD_MIN_LENGTH symbols' do
      car.description = 'a' * (described_class::DESCRIPTION_FIELD_MIN_LENGTH - 1)
      car.valid?
      expect(car.errors[:description]).to include(
        "#{described_class::DESCRIPTION_FIELD_MIN_LENGTH} characters is the minimum allowed"
      )
    end
  end

  describe 'scopes' do
    let!(:opel_kadett) do
      create(:car, :opel_kadett)
    end
    let!(:honda_civic) do
      create(:car, :honda_civic)
    end
    let!(:toyota_corolla) do
      create(:car, :toyota_corolla)
    end
    let!(:zaz_sens) do
      create(:car, :zaz_sens)
    end

    context 'when filter by make' do
      it 'returns car with the specific make' do
        expect(described_class.filter_by_make('Opel')).to contain_exactly(opel_kadett)
      end
    end

    context 'when filter by model' do
      it 'returns car with the specific model' do
        expect(described_class.filter_by_model('Civic')).to contain_exactly(honda_civic)
      end
    end

    context 'when filter by year from' do
      it 'returns car with the specific year from' do
        expect(described_class.filter_by_year_from(2004)).to contain_exactly(toyota_corolla, zaz_sens)
      end
    end

    context 'when filter by year to' do
      it 'returns car with the specific year to' do
        expect(described_class.filter_by_year_to(2002)).to contain_exactly(opel_kadett, honda_civic)
      end
    end

    context 'when filter by price from' do
      it 'returns car with the specific price to' do
        expect(described_class.filter_by_price_from(1000)).to contain_exactly(honda_civic, toyota_corolla, zaz_sens)
      end
    end

    context 'when filter by price to' do
      it 'returns car with the specific price to' do
        expect(described_class.filter_by_price_to(1000)).to contain_exactly(opel_kadett, honda_civic)
      end
    end

    context 'when filter sort by' do
      it 'return cars sorted by price ASC' do
        expect(described_class.filter_sort_by('price ASC')).to eq([opel_kadett, honda_civic, zaz_sens, toyota_corolla])
      end

      it 'return cars sorted by price DESC' do
        expect(described_class.filter_sort_by('price DESC')).to eq([opel_kadett, honda_civic, zaz_sens,
                                                                    toyota_corolla].reverse)
      end

      it 'return cars sorted by created_at ASC' do
        expect(described_class.filter_sort_by('created_at ASC')).to eq([opel_kadett, honda_civic, toyota_corolla,
                                                                        zaz_sens])
      end

      it 'return cars sorted by created_at DESC' do
        expect(described_class.filter_sort_by('created_at DESC')).to eq([opel_kadett, honda_civic, toyota_corolla,
                                                                         zaz_sens].reverse)
      end
    end
  end
end
