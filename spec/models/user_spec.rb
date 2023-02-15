# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  let(:user) { build(:user) }

  describe 'ActiveRecord matchers' do
    it { is_expected.to have_many(:searches).dependent(:delete_all) }
  end

  describe 'User is correctly created' do
    it 'is valid with valid params' do
      expect(user).to be_valid
    end
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:email) }
    it { is_expected.to have_db_column(:encrypted_password) }
    it { is_expected.to have_db_column(:reset_password_token) }
  end
end
