class Supplier < ApplicationRecord
  self.primary_key = :code
  has_many :skus, foreign_key: :supplier_code, primary_key: :code

  validates :code, :name, presence: true
end
