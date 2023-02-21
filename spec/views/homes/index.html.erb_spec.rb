# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'homes/index.html.haml' do
  before { render }

  it 'renders "button_back_to_home_page" button' do
    expect(rendered).to include('welcome_text')
  end
end
