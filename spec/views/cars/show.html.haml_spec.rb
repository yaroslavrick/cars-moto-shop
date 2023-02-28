# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cars/show' do
  let(:car) { create(:car, :opel_kadett) }

  before do
    assign(:car, car)
    render
  end

  it 'renders make attribute in <p>' do
    expect(rendered).to match(/#{car.make}/)
  end

  it 'renders model attribute in <p>' do
    expect(rendered).to match(/#{car.model}/)
  end

  it 'renders year attribute in <p>' do
    expect(rendered).to match(/#{car.year}/)
  end

  it 'renders odometer attribute in <p>' do
    expect(rendered).to match(/#{car.odometer}/)
  end

  it 'renders price attribute in <p>' do
    expect(rendered).to match(/#{car.price}/)
  end

  it 'renders description attribute in <p>' do
    expect(rendered).to match(/#{car.description}/)
  end
end
