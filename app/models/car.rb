# frozen_string_literal: true

class Car < ApplicationRecord
  scope :filter_by_make, ->(make) { where(make:) }
  scope :filter_by_model, ->(model) { where(model:) }
  scope :filter_by_year_from, ->(year_from) { where('year >= ?', year_from) }
  scope :filter_by_year_to, ->(year_to) { where('year <= ?', year_to) }
  scope :filter_by_price_from, ->(price_from) { where('price >= ?', price_from) }
  scope :filter_by_price_to, ->(price_to) { where('price <= ?', price_to) }
  scope :filter_sort_by, ->(type) { order(type) }
end
