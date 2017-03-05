class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.date :date_of_onset
      t.references :account, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end
