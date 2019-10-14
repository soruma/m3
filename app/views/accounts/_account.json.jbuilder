# frozen_string_literal: true

json.extract! account, :id, :use_id, :name, :created_at, :updated_at
json.use account.use, :id, :name
json.url account_url(account, format: :json)
