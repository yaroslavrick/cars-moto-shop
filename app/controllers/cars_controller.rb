# frozen_string_literal: true

class CarsController < ApplicationController
  SORT_PARAMS = ['created_at asc', 'created_at desc', 'price asc', 'price desc'].freeze

  def index
    @cars = Car.all
    search
    sort
    @total_cars_count = @cars.count
    @pagy, @cars = pagy @cars
  end

  def show
    @car = Car.find(params[:id])
  end

  private

  def search
    return unless params['filter_params'].present? && params['filter_params'].keys.any?

    @cars = CarsService::SearchService.new(params: params['filter_params']).call
  end

  def sort
    @cars = CarsService::SortService.new(params: params[:sort_by]).call if valid_sort_params?
  end

  def valid_sort_params?
    return false if params[:sort_by].blank?

    sort_params = params[:sort_by].downcase
    SORT_PARAMS.include?(sort_params)
  end
end
