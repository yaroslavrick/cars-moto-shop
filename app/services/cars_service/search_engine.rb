# frozen_string_literal: true

module CarsService
  class SearchEngine
    attr_reader :params, :data

    def initialize(params:, data:)
      @params = params
      @data = data
      call
    end

    def call
      search
      @data
    end

    private

    def search
      search_by_rule_options
      search_by_range_options
    end

    def search_by_rule_options
      search_by(params[:make], 'make')
      search_by(params[:model], 'model')
    end

    def search_by(rule, option)
      return data if rule.blank?

      @data.where(option.to_sym => rule.to_sym)
    end

    def search_by_range_options
      search_by_range(params[:price_from], params[:price_to], 'price')
      search_by_range(params[:year_from], params[:year_to], 'year')
    end

    def search_by_range(from, to, rule)
      return if data.empty?

      @data.where(':rule >= :from AND :rule <= :to', { rule:, from:, to: })
    end
  end
end
