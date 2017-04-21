class Account < ApplicationRecord
  belongs_to :use
  has_many :history

  validates_presence_of :use_id, :name
end
