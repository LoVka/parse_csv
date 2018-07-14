require 'test_helper'
require 'shoulda/matchers'

RSpec.describe Supplier, type: :model do
  describe 'database' do
    it { is_expected.to have_db_column(:code).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:skus) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:code) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
