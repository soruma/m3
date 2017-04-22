class Account < ApplicationRecord
  belongs_to :use
  has_many :history

  validates_presence_of :name

  protected #------------------------------------
  def self.updatable_attributes
    ['id', 'use_id', 'name']
  end
end
