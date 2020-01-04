# frozen_string_literal: true

class Account < ApplicationRecord
  include ToCsv
  include FileImport

  belongs_to :use
  has_many :histories, dependent: :restrict_with_error

  validates :name, presence: true

  scope :referential, -> { preload(:use) }
end
