# frozen_string_literal: true

json.extract! history, :id, :date_of_onset, :account_id, :price, :created_at, :updated_at
json.url history_url(history, format: :json)
