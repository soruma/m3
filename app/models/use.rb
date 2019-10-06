# frozen_string_literal: true

class Use < ApplicationRecord
  has_many :account, dependent: :restrict_with_error

  validates :name, presence: true
end
