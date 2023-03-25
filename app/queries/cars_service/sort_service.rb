# frozen_string_literal: true

module CarsService
  class SortService
    # attr_reader :data
    #
    # def initialize(params:, data: Car.all)
    #   @params = params
    #   @data = data
    # end
    #
    # def call
    #   @data.filter_sort_by(@params)
    # end
    include Interactor

    attr_reader :data

    def call
      @data = Car.all
      @data.filter_sort_by(context.params)
    end
  end
end
