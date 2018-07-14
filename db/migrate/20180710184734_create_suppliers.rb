class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers, id: false do |t|
      t.primary_key :code, :string, index: :unique
      t.string :name, null: false

      t.timestamps
    end
  end
end
