# frozen_string_literal: true

class CarsController < ApplicationController
  SORT_PARAMS = ['created_at asc', 'created_at desc', 'price asc', 'price desc'].freeze
  before_action :authenticate_user!, only: %i[create new]

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

  def new
    @car = Car.new
  end

  def create
    @car = current_user.cars.build(car_params)
    if @car.save
      redirect_to @car, notice: t('.success')
    else
      render 'new'
    end
  end

  private

  def search
    return unless params['filter_params'].present? && params['filter_params'].keys.any?

    @cars = search_cars.cars
  end

  def sort
    @cars = sort_cars.cars if valid_sort_params?
  end

  def search_cars
    Cars::Searcher.call(params: params['filter_params'], cars: @cars)
  end

  def sort_cars
    Cars::Sorter.call(params: params[:sort_by], cars: @cars)
  end

  def valid_sort_params?
    return false if params[:sort_by].blank?

    sort_params = params[:sort_by].downcase
    SORT_PARAMS.include?(sort_params)
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :odometer, :price, :description)
  end
end
