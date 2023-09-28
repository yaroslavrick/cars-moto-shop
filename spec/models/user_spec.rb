# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  let(:user) { build(:user) }

  describe 'ActiveRecord matchers' do
    it { is_expected.to have_many(:searches).dependent(:delete_all) }
    it { is_expected.to have_many(:cars) }
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

  describe 'Email and password correctness' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(8).is_at_most(128) }
    it { is_expected.to validate_confirmation_of(:password) }
    it { is_expected.to allow_value('test@tesing.com').for(:email) }
    it { is_expected.not_to allow_value('test').for(:email) }

    context 'when password is too short' do
      subject(:new_user) { build(:user, password: '1234567', password_confirmation: '1234567') }

      it { is_expected.not_to be_valid }

      it 'return error' do
        new_user.valid?
        expect(new_user.errors.first.type).to eq(:too_short)
      end
    end

    context 'when email is invalid' do
      subject(:new_user) { build(:user, email: 'test') }

      it { expect(new_user).not_to be_valid }

      it 'return error' do
        new_user.valid?
        expect(new_user.errors.first.type).to eq(:invalid)
      end
    end
  end
end
