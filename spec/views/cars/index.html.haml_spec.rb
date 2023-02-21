# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cars/index' do
  let(:pagy) { Pagy.new(count: 3, page: 1) }

  before do
    assign(:cars, [])
    assign(:total_cars_count, 0)
    assign(:pagy, pagy)
  end

  context 'when there are no cars' do
    before { render }

    it 'displays a message that no cars were found' do
      expect(rendered).to include(I18n.t('cars.index.no_cars_found'))
    end

    it 'includes a link to the search page' do
      expect(rendered).to include(new_search_path)
    end

    it 'does not show a count of cars' do
      expect(rendered).not_to include(I18n.t('cars.index.total_cars_count'))
    end

    it 'does not show a sorting form' do
      expect(rendered).not_to include('cars/sort_form')
    end

    it 'does not show any cars' do
      expect(rendered).not_to include('cars/car_card')
    end
  end

  context 'when there is one cars' do
    let(:car) { create(:car) }

    before do
      assign(:cars, [car])
      assign(:total_cars_count, 1)
      render
    end

    it 'displays a count of cars' do
      expect(rendered).to include("#{I18n.t('cars.index.total_cars_count')}  \n<b>1</b>")
    end

    it 'displays the car cards' do
      expect(rendered).to include("car_#{car.id}")
    end

    it 'displays the car make in cards' do
      expect(rendered).to include(car.make)
    end

    it 'displays the car model in cards' do
      expect(rendered).to include(car.model)
    end

    it 'does not include a link to the search page' do
      expect(rendered).not_to include(new_search_path)
    end

    it 'does not include a sorting form' do
      expect(rendered).not_to include('sort_form')
    end

    it 'does not include pagination' do
      expect(rendered).not_to include('pagy')
    end
  end

  context 'when there are more than 1 car' do
    let!(:car1) { create(:car, :zaz_sens) }
    let!(:car2) { create(:car, :opel_kadett) }
    let!(:car3) { create(:car, :nissan_leaf) }

    before do
      assign(:cars, [car1, car2, car3])
      render
    end

    it 'includes a sorting form' do
      expect(rendered).to include('sort_form')
    end

    it 'displays a count of cars' do
      expect(rendered).to include(I18n.t('cars.index.total_cars_count').to_s)
    end

    it 'displays the car cards' do
      expect(rendered).to include("car_#{car1.id}")
    end
  end
end
