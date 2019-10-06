# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :use
  has_many :history, dependent: :restrict_with_error

  validates :name, presence: true
end
