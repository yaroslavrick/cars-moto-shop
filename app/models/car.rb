# frozen_string_literal: true

class Car < ApplicationRecord
  MAKE_FIELD_MINIMUM_LENGTH = 2
  YEAR_FIELD_GREATER_THEN = 1900
  ODOMETER_FIELD_MINIMUM_NUM = 0
  PRICE_FIELD_GREATER_THEN = 0
  DESCRIPTION_FIELD_MIN_LENGTH = 6
  DESCRIPTION_FIELD_MAX_LENGTH = 300

  validates :make, presence: true, length: { minimum: MAKE_FIELD_MINIMUM_LENGTH,
                                             too_short: '%<count>s characters is the minimum allowed' }
  validates :model, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than: YEAR_FIELD_GREATER_THEN }
  validates :odometer, presence: true, numericality: { only_integer: true,
                                                       greater_than_or_equal_to: ODOMETER_FIELD_MINIMUM_NUM }
  validates :price, presence: true, numericality: { greater_than: PRICE_FIELD_GREATER_THEN }
  validates :description, presence: true, length: { in: DESCRIPTION_FIELD_MIN_LENGTH..DESCRIPTION_FIELD_MAX_LENGTH,
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
