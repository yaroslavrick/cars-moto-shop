# frozen_string_literal: true

module CarsService
  class SortService
    attr_reader :data

    def initialize(params:, data:)
      @params = params
      @data = data
    end

    def call
      @data.order(@params)
      # @data.filter_sort_by(@params)
    end
  end
end
