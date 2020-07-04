# frozen_string_literal: true

module ToCsv
  extend ActiveSupport::Concern

  module ClassMethods
    def to_csv(scope, options = default_csv_options)
      CSV.generate(**options) do |csv|
        csv << updatable_attributes
        scope.find_each do |row|
          csv << row.attributes.values_at(*updatable_attributes)
        end
      end
    end

    def default_csv_options
      { row_sep: "\r\n" }
    end
  end
end
