class History < ApplicationRecord
  belongs_to :account

  validates_uniqueness_of :account, scope: [:date_of_onset, :account]

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: 'Shift_JIS') do |row|
      obj = History.find(row['id']) rescue new
      obj.attributes = row.to_hash.slice(*updatable_attributes)
      obj.save!
    end
  end

  def self.updatable_attributes
    ['id', 'date_of_onset', 'account_id', 'price']
  end
end
