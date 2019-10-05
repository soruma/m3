# frozen_string_literal: true

json.extract! event, :id, :date_of_onset, :name, :remarks, :created_at, :updated_at
json.url event_url(event, format: :json)
