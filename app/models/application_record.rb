class ApplicationRecord < ActiveRecord::Base
  include FileImportHelper

  self.abstract_class = true
end
