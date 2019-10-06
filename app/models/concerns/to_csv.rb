# frozen_string_literal: true

module ToCsv
  def to_csv(scope, options = {})
    CSV.generate(options) do |csv|
      csv << updatable_attributes
      scope.each do |row|
        csv << row.attributes.values_at(*updatable_attributes)
      end
    end
  end
end
