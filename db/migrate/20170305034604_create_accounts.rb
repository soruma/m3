class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.references :use, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
