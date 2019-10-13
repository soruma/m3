# frozen_string_literal: true

module HistoryDecorator
  include DateFormmater

  def onset_month
    date_to_month(date_of_onset)
  end
end
