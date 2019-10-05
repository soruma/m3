# frozen_string_literal: true

module ApplicationHelper
  def date_to_month(date)
    format('%<year>d/%02<month>d', year: date.year, month: date.month)
  end
end
