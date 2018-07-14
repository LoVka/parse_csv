require 'test_helper'
require 'shoulda/matchers'

RSpec.describe Sku, type: :model do
  describe 'database' do
    it { is_expected.to have_db_column(:sku_code).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:supplier_code).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:price).of_type(:float).with_options(null: false) }
    it { is_expected.to have_db_column(:extra_attribute).of_type(:string) }
    it { is_expected.to have_db_column(:extra_attribute_2).of_type(:string) }
    it { is_expected.to have_db_column(:extra_attribute_3).of_type(:string) }
    it { is_expected.to have_db_column(:extra_attribute_4).of_type(:string) }
    it { is_expected.to have_db_column(:extra_attribute_5).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:supplier) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:sku_code) }
    it { is_expected.to validate_presence_of(:supplier_code) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
  end
end
