# frozen_string_literal: true

module Cars
  class Sorter
    include Interactor

    attr_reader :data

    def call
      context.cars.filter_sort_by(context.params)
    end
  end
end
