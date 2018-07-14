class Sku < ApplicationRecord
  belongs_to :supplier, foreign_key: :supplier_code, primary_key: :code

  validates :sku_code, :supplier_code, :name, :price, presence: true
end
