# frozen_string_literal: true

class CarsController < ApplicationController
  SORT_PARAMS = ['created_at asc', 'created_at desc', 'price asc', 'price desc'].freeze

  def index
    @cars = Car.all
    @cars = CarsService::SearchService.new(params: params['filter_params'], data: @cars).call if search_params.present?
    @cars = CarsService::SortService.new(params: params[:sort_by], data: @cars).call if valid_sort_params?
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

  def valid_sort_params?
    return false if params[:sort_by].blank?

    sort_params = params[:sort_by].downcase
    SORT_PARAMS.include?(sort_params)
  end
end
