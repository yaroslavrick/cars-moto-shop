# frozen_string_literal: true

class Search < ApplicationRecord
  belongs_to :user

  validates :make, presence: true,
                   length: { minimum: 2, too_short: t('models.car.too_short') },
                   allow_blank: true
  validates :model, presence: true, allow_blank: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 1900 }, allow_nil: true
  validates :odometer, presence: true, numericality: { only_integer: true }, allow_nil: true
  validates :price, presence: true, numericality: true, allow_nil: true
end
