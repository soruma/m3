# frozen_string_literal: true

class Event < ApplicationRecord
  validates :date_of_onset, presence: true

  validates :name, presence: true

  scope :time_series, -> { order(:date_of_onset) }
end
