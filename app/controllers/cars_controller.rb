# frozen_string_literal: true

class CarsController < ApplicationController
  SORT_PARAMS = ['created_at asc', 'created_at desc', 'price asc', 'price desc'].freeze

  def index
    @cars = Car.all
    search
    sort
    @total_cars_count = @cars.count
    @pagy, @cars = pagy @cars
    @cars
  end

  def show
    @car = Car.find(params[:id])
  end

  private

  def search
    return unless params['filter_params'].present? && params['filter_params'].keys.any?

    @cars = search_cars
  end

  def sort
    @cars = sort_cars if valid_sort_params?
  end

  def search_cars
    Cars::Searcher.new(params: params['filter_params'], cars: @cars).call
  end

  def sort_cars
    Cars::Sorter.new(params: params[:sort_by], cars: @cars).call
  end

  def valid_sort_params?
    return false if params[:sort_by].blank?

    sort_params = params[:sort_by].downcase
    SORT_PARAMS.include?(sort_params)
  end
end
