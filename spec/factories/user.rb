# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { 'Password123' }
    password_confirmation { 'Password123' }
  end
end
