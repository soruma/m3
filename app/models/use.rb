class Use < ApplicationRecord
  has_many :account

  validates :name, presence: true
end
