# frozen_string_literal: true

class Use < ApplicationRecord
  has_many :accounts, dependent: :restrict_with_error

  validates :name, presence: true

  scope :referential, -> { includes(:accounts) }
end
