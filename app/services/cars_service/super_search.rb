# frozen_string_literal: true

module CarsService
  class SuperSearch
    attr_reader :data, :condition

    def initialize(params:, data:)
      @params = params
      @data = data
      @condition = {}
    end

    def call
      apply_filters
      @data = @data.where(@condition)
    end

    private

    def apply_filters
      apply_make
      apply_model
      apply_year_from
      apply_year_to
      apply_price_from
      apply_price_to
    end

    def apply_make
      return if @params[:make].blank?

      @condition.merge!(make: @params['make'])
    end

    def apply_model
      return if @params[:model].blank?

      @condition.merge!(model: @params['model'])
    end

    def apply_year_from
      return if @params['year_from'].blank?

      @condition.merge!('year >= ?', @params['year_from'].to_i)
    end

    def apply_year_to
      return if @params['year_to'].blank?

      @condition.merge!('year >= ?', @params['year_to'].to_i)
    end

    def apply_price_from
      return if @params['price_from'].blank?

      @condition.merge!('price >= ?', @params['price_from'].to_i)
    end

    def apply_price_to
      return if @params['price_to'].blank?

      @condition.merge!('price >= ?', @params['price_to'].to_i)
    end
  end
end
