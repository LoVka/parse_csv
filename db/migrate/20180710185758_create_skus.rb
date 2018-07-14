class CreateSkus < ActiveRecord::Migration[5.2]
  def change
    create_table :skus do |t|
      t.string :sku_code, null: false
      t.string :supplier_code, null: false, index: true
      t.string :name, null: false
      t.float :price, null: false
      t.string :extra_attribute
      t.string :extra_attribute_2
      t.string :extra_attribute_3
      t.string :extra_attribute_4
      t.string :extra_attribute_5

      t.references :supplier, null: false, index: true

      t.timestamps
    end
  end
end
