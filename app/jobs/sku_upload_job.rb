class SkuUploadJob < ApplicationJob
  require 'smarter_csv'
  queue_as :skus

  def perform(file_path)
    data = SmarterCSV.process(file_path,
                              col_sep: '¦',
                              headers_in_file: false,
                              convert_values_to_numeric: false,
                              user_provided_headers: %i[sku_code supplier_code name extra_attribute extra_attribute_2 extra_attribute_3 extra_attribute_4 extra_attribute_5 price],
                              verbose: true
    )

    valid_keys = %i(sku_code supplier_code name price)
    data.each do |attr|
      next unless valid_keys.all? {|s| attr.key? s}
      attr[:supplier_id] = attr[:supplier_code]
      Sku.find_or_initialize_by(sku_code: attr[:sku_code]).update_attributes(attr.except(:sku_code))
    end
  end
end
