# frozen_string_literal: true

module CarsService
  class SearchEngine
    def initialize(params:, data:)
      @params = params
      @data = data
    end

    def call
      search
      @data
    end

    private

    def search
      search_by_make
      search_by_model
      search_by_year_from
      search_by_year_to
      search_by_price_from
      search_by_price_to
    end

    def search_by_make
      @data = @data.where(make: @params['make']) if @params['make'].present?
    end

    def search_by_model
      @data = @data.where(model: @params['model']) if @params['model'].present?
    end

    def search_by_year_from
      @data = @data.where('year >= ?', @params['year_from'].to_i) if @params['year_from'].present?
    end

    def search_by_year_to
      @data = @data.where('year <= ?', @params['year_to'].to_i) if @params['year_to'].present?
    end

    def search_by_price_from
      @data = @data.where('price >= ?', @params['price_from'].to_i) if @params['year_from'].present?
    end

    def search_by_price_to
      @data = @data.where('price <= ?', @params['price_to'].to_i) if @params['year_to'].present?
    end
  end
end
