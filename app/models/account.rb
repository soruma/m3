class Account < ApplicationRecord
  belongs_to :use
  has_many :history

  validates_presence_of :name
end
