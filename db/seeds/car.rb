# frozen_string_literal: true

test_user_password = 'P@ssw0rd!'

test_user = User.create!(
  email: 'test@example.com',
  password: test_user_password,
  password_confirmation: test_user_password
)

MAKES_TO_MODELS = {
  'Audi' => %w[A4 A6 Q5 Q7 Q8 e-tron],
  'BMW' => ['3 Series', '5 Series', 'X3', 'X5', 'X7', 'M4'],
  'Chevrolet' => %w[Camaro Impala Malibu Silverado Tahoe Equinox],
  'Ford' => %w[Fiesta Focus Mustang Escape Explorer F-150],
  'GMC' => %w[Sierra Canyon Terrain Acadia Yukon Savana],
  'Honda' => %w[Civic Accord CR-V Odyssey Pilot Ridgeline],
  'Jeep' => ['Wrangler', 'Grand Cherokee', 'Cherokee', 'Compass', 'Renegade', 'Gladiator'],
  'Mazda' => ['Mazda3', 'Mazda6', 'CX-3', 'CX-5', 'CX-9', 'MX-5 Miata'],
  'Mercedes-Benz' => %w[C-Class E-Class S-Class GLC GLE GLS],
  'Nissan' => %w[Altima Maxima Sentra Rogue Pathfinder Titan Leaf],
  'Opel' => %w[Kadett Astra Corsa Zafira Vivaro Ampera-e],
  'Subaru' => %w[Impreza Legacy Outback Forester Crosstrek Ascent],
  'Toyota' => %w[Corolla Camry Rav4 Highlander Tacoma Tundra]
}.freeze

def create_car(user)
  make = nil
  loop do
    make = FFaker::Vehicle.make
    break if MAKES_TO_MODELS[make].present?
  end

  model = MAKES_TO_MODELS[make].sample

  create_by_params(make:, model:, user:)
end

def create_by_params(make:, model:, user:)
  Car.create(
    make:,
    model:,
    user:,
    year: generate_year,
    odometer: FFaker::Random.rand(1..300_000),
    price: FFaker::Random.rand(1000..500_00),
    description: FFaker::Book.description(2)
  )
end

def generate_year
  Time.zone.at(Time.new(1990).to_f + (rand * (Time.now.to_f - Time.new(1990).to_f))).to_date.year
end

50.times { create_car(test_user) }

Rails.logger.debug 'Cars and test user created!'
