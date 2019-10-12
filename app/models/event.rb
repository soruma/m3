# frozen_string_literal: true

class Event < ApplicationRecord
  validates :date_of_onset, presence: true

  validates :name, presence: true
end
