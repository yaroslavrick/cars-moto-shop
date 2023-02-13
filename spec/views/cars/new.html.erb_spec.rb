# frozen_string_literal: true
# # frozen_string_literal: true
#
# require 'rails_helper'
#
# RSpec.describe 'cars/new', type: :view do
#   before(:each) do
#     assign(:car, Car.new(
#                    make: 'MyString',
#                    model: 'MyString',
#                    year: 1,
#                    odometer: 1,
#                    price: '9.99',
#                    description: 'MyString'
#                  ))
#   end
#
#   it 'renders new car form' do
#     render
#
#     assert_select 'form[action=?][method=?]', cars_path, 'post' do
#       assert_select 'input[name=?]', 'car[make]'
#
#       assert_select 'input[name=?]', 'car[model]'
#
#       assert_select 'input[name=?]', 'car[year]'
#
#       assert_select 'input[name=?]', 'car[odometer]'
#
#       assert_select 'input[name=?]', 'car[price]'
#
#       assert_select 'input[name=?]', 'car[description]'
#     end
#   end
# end
