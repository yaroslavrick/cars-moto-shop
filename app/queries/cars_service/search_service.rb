# frozen_string_literal: true

module CarsService
  class SearchService
    def initialize(params:, data: Car.all)
      @params = params
      @data = data
    end

    def call
      search_by_make
      search_by_model
      search_by_year_from
      search_by_year_to
      search_by_price_from
      search_by_price_to
      @data
    end

    private

    def search_by_make
      return @data if @params['make'].blank?

      @data = @data.filter_by_make(@params['make'])
    end

    def search_by_model
      return @data if @params['model'].blank?

      @data = @data.filter_by_model(@params['model'])
    end

    def search_by_year_from
      return @data if @params['year_from'].blank?

      @data = @data.filter_by_year_from(@params['year_from'].to_i)
    end

    def search_by_year_to
      return @data if @params['year_to'].blank?

      @data = @data.filter_by_year_to(@params['year_to'].to_i)
    end

    def search_by_price_from
      return @data if @params['price_from'].blank?

      @data = @data.filter_by_price_from(@params['price_from'].to_i)
    end

    def search_by_price_to
      return @data if @params['price_to'].blank?

      @data = @data.filter_by_price_to(@params['price_to'].to_i) if @params['year_to'].present?
    end
  end
end
