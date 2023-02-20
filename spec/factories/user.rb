# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { 'SecretPassword123' }
    password_confirmation { 'SecretPassword123' }
  end
end
