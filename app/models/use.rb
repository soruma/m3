class Use < ApplicationRecord
  has_many :account
  validates_presence_of :name

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: 'Shift_JIS') do |row|
      obj = Use.find(row['id']) rescue new
      obj.attributes = row.to_hash.slice(*updatable_attributes)
      obj.save!
    end
  end

  def self.updatable_attributes
    ['id', 'name']
  end
end
