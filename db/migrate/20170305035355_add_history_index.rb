class AddHistoryIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :histories, %i[date_of_onset account_id], unique: true
  end
end
