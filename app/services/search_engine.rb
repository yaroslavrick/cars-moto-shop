# frozen_string_literal: true

class SearchEngine
  SORTING = {
    'Date added asc' => { created_at: :asc },
    'Date added desc' => { created_at: :desc },
    'Price asc' => { price: :asc },
    'Price desc' => { price: :desc }
  }.freeze

  attr_reader :params, :data

  def initialize(params)
    @params = params[:params]
    @data = Car.all
    call
  end

  def call
    search
    @data = sort
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

    data.where(':option: :rule', { rule:, option: })
  end

  def search_by_range_options
    search_by_range(params[:price_from], params[:price_to], 'price')
    search_by_range(params[:year_from], params[:year_to], 'year')
  end

  def search_by_range(from, to, rule)
    return if data.empty?

    data.where(':rule >= :from AND :rule <= :to', { rule:, from:, to: })
  end

  def sort
    return data if params[:sort_by].blank?

    data.order(**SORTING[params[:sort_by]]) if params[:sort_by].present?
  end
end
