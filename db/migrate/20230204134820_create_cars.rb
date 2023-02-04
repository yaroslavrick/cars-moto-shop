# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :odometer
      t.decimal :price
      t.string :description

      t.timestamps
    end
  end
end
