# frozen_string_literal: true

Event.seed(
  :id,
  [
    { id: 1, date_of_onset: '2019-01-01', name: %(New Year's Day) },
    { id: 2, date_of_onset: '2019-12-25', name: 'Christmas Day' }
  ]
)
