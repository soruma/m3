class History < ApplicationRecord
  belongs_to :account

  validates_uniqueness_of :account, scope: [:date_of_onset, :account]
end
