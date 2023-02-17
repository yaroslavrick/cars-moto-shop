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

  trait :honda_civic do
    make { 'Honda' }
    model { 'Civic' }
    year { 2001 }
    odometer { FFaker::Random.rand(1..300_000) }
    price { 1000 }
    description { FFaker::Lorem.characters(300) }
  end

  trait :zaz_sens do
    make { 'Zaz' }
    model { 'Sens' }
    year { 2013 }
    odometer { FFaker::Random.rand(1..300_000) }
    price { 3000 }
    description { FFaker::Lorem.characters(300) }
  end

  trait :opel_kadett do
    make { 'Opel' }
    model { 'Kadett' }
    year { 1985 }
    odometer { FFaker::Random.rand(1..300_000) }
    price { 800 }
    description { FFaker::Lorem.characters(300) }
  end

  trait :nissan_leaf do
    make { 'Nissan' }
    model { 'Leaf' }
    year { 2012 }
    odometer { FFaker::Random.rand(1..300_000) }
    price { 14_000 }
    description { FFaker::Lorem.characters(300) }
  end

  trait :toyota_corolla do
    make { 'Toyota' }
    model { 'Corolla' }
    year { 2005 }
    odometer { FFaker::Random.rand(1..300_000) }
    price { 4000 }
    description { FFaker::Lorem.characters(300) }
  end
end
