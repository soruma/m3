# frozen_string_literal: true

class History < ApplicationRecord
  belongs_to :account

  validates :account, uniqueness: { scope: %i[date_of_onset account] }
end
