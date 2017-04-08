class Account < ApplicationRecord
  belongs_to :use
  has_many :history
end
