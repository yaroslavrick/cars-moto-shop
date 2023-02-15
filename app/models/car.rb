# frozen_string_literal: true

class Car < ApplicationRecord
  validates :make, presence: true, length: { minimum: 2, too_short: '%<count>s characters is the minimum allowed' }
  validates :model, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 1900 }
  validates :odometer, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: true
  validates :description, presence: true, length: { in: 6..50,
                                                    too_short: '%<count>s characters is the minimum allowed',
                                                    too_long: '%<count>s characters is the maximum allowed' }

  scope :filter_by_make, ->(make) { where(make:) }
  scope :filter_by_model, ->(model) { where(model:) }
  scope :filter_by_year_from, ->(year_from) { where('year >= ?', year_from) }
  scope :filter_by_year_to, ->(year_to) { where('year <= ?', year_to) }
  scope :filter_by_price_from, ->(price_from) { where('price >= ?', price_from) }
  scope :filter_by_price_to, ->(price_to) { where('price <= ?', price_to) }
  scope :filter_sort_by, ->(type) { order(type) }
end
