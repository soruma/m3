# frozen_string_literal: true

json.labels @histories.date_of_onset_list
json.datasets do
  json.array! @accounts do |account|
    json.label account.name
    json.backgroundColor '#faaf08'
    json.data account.histories.price_list
  end
end
