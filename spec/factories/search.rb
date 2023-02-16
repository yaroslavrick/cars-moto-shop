# frozen_string_literal: true

FactoryBot.define do
  # factory :search do
  #   make { FFaker::Vehicle.make }
  #   model { FFaker::Vehicle.model }
  #   year_from { 1990 }
  #   year_to { 2018 }
  #   price_from { 2_500 }
  #   price_to { 900_000 }
  #   user
  # end
  factory :search do
    make { 'Ford' }
    model { 'Integra' }
    year_from { 1990 }
    year_to { 2019 }
    price_from { 2_500 }
    price_to { 900_000 }
    user
  end
end
