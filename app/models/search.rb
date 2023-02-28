# frozen_string_literal: true

class Search < ApplicationRecord
  belongs_to :user

  validates_associated :user
end
