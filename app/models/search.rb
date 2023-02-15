# frozen_string_literal: true

class Search < ApplicationRecord
  belongs_to :user

  # validates :make, allow_nil: true
  # validates :model
  # validates :year_from, numericality: { only_integer: true, greater_than: 1900 }, allow_nil: true
  # validates :year_to, numericality: { only_integer: true, in: 1900..Time.zone.today.year }
  # validates :price_from, numericality: true, allow_nil: true
  # validates :price_to, numericality: true, allow_nil: true
end
