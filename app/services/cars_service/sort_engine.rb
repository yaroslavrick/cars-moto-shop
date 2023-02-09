# frozen_string_literal: true

module CarsService
  class SortEngine
    attr_reader :data

    def initialize(params:, data:)
      @params = params
      @data = data
    end

    def call
      @data.order(@params)
    end
  end
end
