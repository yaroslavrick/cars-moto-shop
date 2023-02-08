# frozen_string_literal: true

module CarsService
  class SortEngine
    # SORTING = {
    #   'Date added asc' => { created_at: :asc },
    #   'Date added desc' => { created_at: :desc },
    #   'Price asc' => { price: :asc },
    #   'Price desc' => { price: :desc }
    # }.freeze

    SORTING = {
      'Created_at asc' => { created_at: :asc },
      'Created_at desc' => { created_at: :desc },
      'Price asc' => { price: :asc },
      'Price desc' => { price: :desc }
    }.freeze

    attr_reader :params, :data

    def initialize(params:, data:)
      @params = params
      @data = data
      call
    end

    def call
      @data = sort
    end

    private

    def sort
      return data if params[:sort_by].blank?

      data.order(**SORTING[params[:sort_by]]) if params[:sort_by].present?
    end
  end
end
