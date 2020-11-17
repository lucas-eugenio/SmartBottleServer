# frozen_string_literal: true

# db/migrate/CreateWaterConsumes
class CreateWaterConsumes < ActiveRecord::Migration[6.0]
  def change
    create_table :water_consumes do |t|
      t.float :consume
      t.float :measure
      t.string :liquid
      t.float :density
      t.datetime :time
    end
  end
end
