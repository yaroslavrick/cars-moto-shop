# frozen_string_literal: true

FactoryBot.define do
  factory :search do
    make { 'Ford' }
    model { 'Integra' }
    year_from { 1990 }
    year_to { 2019 }
    price_from { 2_500 }
    price_to { 900_000 }
    user
  end

  trait :search_zaz_sens do
    make { 'Zaz' }
    model { 'Sens' }
    year_from { 2013 }
    year_to { 2013 }
    price_from { 3000 }
    price_to { 3000 }
    user
  end
end
