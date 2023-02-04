# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cars/show', type: :view do
  before(:each) do
    assign(:car, Car.create!(
                   make: 'Make',
                   model: 'Model',
                   year: 2,
                   odometer: 3,
                   price: '9.99',
                   description: 'Description'
                 ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Make/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Description/)
  end
end
