class SupplierUploadJob < ApplicationJob
  require 'smarter_csv'
  queue_as :suppliers

  def perform(file_path)
    data = SmarterCSV.process(file_path,
                              col_sep: '¦',
                              headers_in_file: false,
                              convert_values_to_numeric: false,
                              user_provided_headers: %i[code name],
                              verbose: true
    )

    valid_keys = %i(code name)
    data.each do |attr|
      next unless valid_keys.all? {|s| attr.key? s}
      Supplier.find_or_initialize_by(code: attr[:code]).update_attributes(attr.except(:code))
    end
  end
end