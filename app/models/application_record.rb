class ApplicationRecord < ActiveRecord::Base
  extend FileImportHelper

  self.abstract_class = true

  protected

  #=== real model attribute names
  # ex)
  # > Person.attribute_names
  # => ["id", "name", "age", "created_at", "updated_at"]
  # > Person.updatable_attributes
  # => ["id", "name", "age"]
  def self.updatable_attributes
    attribute_names.clone.delete_if { |item| TIMESTAMP_COLUMNS.include?(item) }
  end

  private

  TIMESTAMP_COLUMNS = %w[created_at created_on updated_at updated_on]
end
