# frozen_string_literal: true

module ApplicationHelper
  def date_to_month(date)
    format("%d/%02d", date.year, date.month)
  end
end
