# frozen_string_literal: true

module CarsService
  class SortService
    include Interactor

    attr_reader :data

    def call
      @data = Car.all
      @data.filter_sort_by(context.params)
    end
  end
end
