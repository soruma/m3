class History < ApplicationRecord
  belongs_to :account

  validates_uniqueness_of :account, scope: [:date_of_onset, :account]

  protected #------------------------------------
  def self.updatable_attributes
    ['id', 'date_of_onset', 'account_id', 'price']
  end
end
