# frozen_string_literal: true

class History < ApplicationRecord
  belongs_to :account

  validates :date_of_onset, presence: true

  validates :account, presence: true
  validates :account, uniqueness: { scope: %i[date_of_onset account] }

  validates :price, presence: true

  scope :account_book, -> { order(:date_of_onset).order(:account_id) }
  scope :referential, -> { includes(:account) }
end
