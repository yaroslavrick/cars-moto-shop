# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cars/index', type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        make: 'Make',
        model: 'Model',
        year: 2,
        odometer: 3,
        price: '9.99',
        description: 'Description'
      ),
      Car.create!(
        make: 'Make',
        model: 'Model',
        year: 2,
        odometer: 3,
        price: '9.99',
        description: 'Description'
      )
    ])
  end

  it 'renders a list of cars' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Make'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Model'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Description'.to_s), count: 2
  end
end
