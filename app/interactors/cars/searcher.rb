# frozen_string_literal: true

module Cars
  class Searcher
    include Interactor
    def call
      search_by_make
      search_by_model
      search_by_year_from
      search_by_year_to
      search_by_price_from
      search_by_price_to

      context.cars
    end

    private

    def search_by_make
      return context.cars if context.params['make'].blank?

      context.cars = context.cars.filter_by_make(context.params['make'])
    end

    def search_by_model
      return context.cars if context.params['model'].blank?

      context.cars = context.cars.filter_by_model(context.params['model'])
    end

    def search_by_year_from
      return context.cars if context.params['year_from'].blank?

      context.cars = context.cars.filter_by_year_from(context.params['year_from'].to_i)
    end

    def search_by_year_to
      return context.cars if context.params['year_to'].blank?

      context.cars = context.cars.filter_by_year_to(context.params['year_to'].to_i)
    end

    def search_by_price_from
      return context.cars if context.params['price_from'].blank?

      context.cars = context.cars.filter_by_price_from(context.params['price_from'].to_i)
    end

    def search_by_price_to
      return context.cars if context.params['price_to'].blank?

      context.cars = context.cars.filter_by_price_to(context.params['price_to'].to_i)
    end
  end
end
