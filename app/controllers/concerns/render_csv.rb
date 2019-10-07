# frozen_string_literal: true

module RenderCsv
  def render_csv(csv, file_name:, charset:)
    send_data(csv,
              type: "text/csv; charset=#{charset}; header=present",
              disposition: "attachment; filename=\"#{file_name}.csv\"")
  end
end
