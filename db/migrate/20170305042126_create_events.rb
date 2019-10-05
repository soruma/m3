# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.date :date_of_onset
      t.string :name
      t.string :remarks

      t.timestamps
    end
  end
end
