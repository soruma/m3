class Use < ApplicationRecord
  has_many :account

  validates_presence_of :name

  protected #------------------------------------
  def self.updatable_attributes
    ['id', 'name']
  end
end
