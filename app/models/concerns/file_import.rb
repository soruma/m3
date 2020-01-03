# frozen_string_literal: true

module FileImport
  extend ActiveSupport::Concern

  module ClassMethods
    def csv_file_import(upload_file)
      CSV.foreach(upload_file.path, headers: true, encoding: 'Shift_JIS') do |row|
        obj = begin
                find(row['id'])
              rescue StandardError
                new
              end
        obj.attributes = row.to_hash.slice(*updatable_attributes)
        obj.save!
      end
    end
  end
end
