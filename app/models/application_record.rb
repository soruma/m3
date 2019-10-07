# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  extend ToCsv
  extend FileImportHelper

  self.abstract_class = true

  TIMESTAMP_COLUMNS = %w[created_at created_on updated_at updated_on].freeze

  class << self
    #=== real model attribute names
    # ex)
    # > Person.attribute_names
    # => ["id", "name", "age", "created_at", "updated_at"]
    # > Person.updatable_attributes
    # => ["id", "name", "age"]
    def updatable_attributes
      attribute_names.clone.delete_if { |item| TIMESTAMP_COLUMNS.include?(item) }
    end
  end
end
