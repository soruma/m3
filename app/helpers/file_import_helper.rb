module FileImportHelper
  #=== file import
  def csv_file_import(upload_file)
    CSV.foreach(upload_file.path, headers: true, encoding: 'Shift_JIS') do |row|
      obj = find(row['id']) rescue new
      obj.attributes = row.to_hash.slice(*updatable_attributes)
      obj.save!
    end
  end
end
