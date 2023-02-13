# frozen_string_literal: true

class Search < ApplicationRecord
  belongs_to :user
  # validates :year_from, numerically: true
  # validates :year_to, numerically: true
end
