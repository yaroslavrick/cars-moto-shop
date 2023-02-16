# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    make { FFaker::Vehicle.make }
    model { FFaker::Vehicle.model }
    year { Time.zone.at(Time.new(1990).to_f + (rand * (Time.now.to_f - Time.new(1990).to_f))).to_date.year }
    odometer { FFaker::Random.rand(1..300_000) }
    price { FFaker::Random.rand(1000..500_00) }
    description { FFaker::Lorem.characters(300) }
  end

  trait :ford do
    make { 'Ford' }
    model { 'Integra' }
    year { 2017 }
    price { 1.2e6 }
    description { FFaker::Lorem.characters(300) }
  end
end
