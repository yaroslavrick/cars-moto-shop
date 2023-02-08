# frozen_string_literal: true

class CarsController < ApplicationController
  # before_action :set_car, only: %i[show edit update destroy]

  def index
    @cars = Car.all
    @cars = CarsService::SearchEngine.new(params: car_search_params, data: @cars).data if car_search_params.present?
    @cars = CarsService::SortEngine.new(params: car_sort_params, data: @cars).data if car_sort_params.present?
    @pagy, @cars = pagy @cars
  end

  def show
    @car = Car.find(params[:id])
  end

  private

  # Only allow a list of trusted parameters through.
  # def car_params
  #   params.require(:car).permit(:make, :model, :year, :odometer, :price, :description)
  # end

  def car_search_params
    # params.permit(:make, :model, :year_from, :year_to, :price_from, :price_to, :sort_by, :locale, :commit, :page)
    params.permit(:make, :model, :year_from, :year_to, :price_from, :price_to)
  end

  def car_sort_params
    params.permit(:sort_by)
  end

  def search_car
    @car = Lib::SearchEngine.new(params: car_search_params)
  end
end
