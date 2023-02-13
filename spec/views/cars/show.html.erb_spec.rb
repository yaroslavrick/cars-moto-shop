# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cars/show' do
  before do
    assign(:car, Car.create!(
                   make: 'Make',
                   model: 'Model',
                   year: 2,
                   odometer: 3,
                   price: '9.99',
                   description: 'Description'
                 ))
    render
  end

  it 'renders make attribute in <p>' do
    expect(rendered).to match(/Make/)
  end

  it 'renders model attribute in <p>' do
    expect(rendered).to match(/Model/)
  end

  it 'renders year attribute in <p>' do
    expect(rendered).to match(/2/)
  end

  it 'renders odometer attribute in <p>' do
    expect(rendered).to match(/3/)
  end

  it 'renders price attribute in <p>' do
    expect(rendered).to match(/9.99/)
  end

  it 'renders description attribute in <p>' do
    expect(rendered).to match(/Description/)
  end
end
