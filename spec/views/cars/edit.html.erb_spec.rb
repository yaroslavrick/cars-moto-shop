# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cars/edit', type: :view do
  let(:car) do
    Car.create!(
      make: 'MyString',
      model: 'MyString',
      year: 1,
      odometer: 1,
      price: '9.99',
      description: 'MyString'
    )
  end

  before(:each) do
    assign(:car, car)
  end

  it 'renders the edit car form' do
    render

    assert_select 'form[action=?][method=?]', car_path(car), 'post' do
      assert_select 'input[name=?]', 'car[make]'

      assert_select 'input[name=?]', 'car[model]'

      assert_select 'input[name=?]', 'car[year]'

      assert_select 'input[name=?]', 'car[odometer]'

      assert_select 'input[name=?]', 'car[price]'

      assert_select 'input[name=?]', 'car[description]'
    end
  end
end
