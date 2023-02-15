# frozen_string_literal: true

class CarsController < ApplicationController
  def index
    @cars = Car.all
    @cars = CarsService::SearchEngine.new(params: params['filter_params'], data: @cars).call if search_params.present?

    @cars = CarsService::SortEngine.new(params: params[:sort_by], data: @cars).call if sort_params.present?
    @total_cars_count = @cars.count
    @pagy, @cars = pagy @cars
  end

  def show
    @car = Car.find(params[:id])
  end

  private

  def search_params
    return false if params['filter_params'].blank?

    params.require(:filter_params).permit(:make, :model, :year_from, :year_to, :price_from, :price_to)
  end

  def sort_params
    params.permit(:sort_by)
  end
end
