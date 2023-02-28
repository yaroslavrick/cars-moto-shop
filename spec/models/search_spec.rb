# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Search do
  let(:user) { build(:user) }
  let(:search) { build(:search) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:user).with_message('must exist') }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:make) }
    it { is_expected.to have_db_column(:model) }
    it { is_expected.to have_db_column(:year_from) }
    it { is_expected.to have_db_column(:year_to) }
    it { is_expected.to have_db_column(:price_from) }
    it { is_expected.to have_db_column(:price_to) }
    it { is_expected.to have_db_column(:user_id) }
    it { is_expected.to have_db_index(:user_id) }
  end
end
