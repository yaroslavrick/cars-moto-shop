# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
25.times do
  Car.create(
    make: FFaker::Vehicle.make,
    model: FFaker::Vehicle.model,
    year: FFaker::Vehicle.year,
    odometer: FFaker::Random.rand(1..300_000),
    price: FFaker::Random.rand(1000..500_00)
  )
end
