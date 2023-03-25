# frozen_string_literal: true

module CarsService
  class SearchService
    include Interactor
    def call
      @data = Car.all
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
      return @data if context.params['make'].blank?

      @data = @data.filter_by_make(context.params['make'])
    end

    def search_by_model
      return @data if context.params['model'].blank?

      @data = @data.filter_by_model(context.params['model'])
    end

    def search_by_year_from
      return @data if context.params['year_from'].blank?

      @data = @data.filter_by_year_from(context.params['year_from'].to_i)
    end

    def search_by_year_to
      return @data if context.params['year_to'].blank?

      @data = @data.filter_by_year_to(context.params['year_to'].to_i)
    end

    def search_by_price_from
      return @data if context.params['price_from'].blank?

      @data = @data.filter_by_price_from(context.params['price_from'].to_i)
    end

    def search_by_price_to
      return @data if context.params['price_to'].blank?

      @data = @data.filter_by_price_to(context.params['price_to'].to_i)
    end
  end
end
