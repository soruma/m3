# frozen_string_literal: true

class History < ApplicationRecord
  include ToCsv
  include FileImport

  belongs_to :account

  validates :date_of_onset, presence: true

  validates :account, presence: true
  validates :account, uniqueness: { scope: %i[date_of_onset account] }

  validates :price, presence: true

  scope :account_book, -> { order(:date_of_onset).order(:account_id) }
  scope :referential, -> { includes(account: [:use]) }

  scope :date_of_onset_list, -> { group(:date_of_onset).order(:date_of_onset).count.keys }
  scope :price_list, -> { order(:date_of_onset).pluck(:price) }
end
