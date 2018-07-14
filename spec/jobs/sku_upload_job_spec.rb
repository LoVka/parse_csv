require 'test_helper'

RSpec.describe SkuUploadJob, type: :model do
  describe "skus save in db" do
    before do
      codes = %w(40758 181 5581 4263 0690 09564 260)
      codes.each {|code| Supplier.create(code: code, name: "name_#{code}")}
    end

    it 'creates skus' do
      expect { subject.perform(File.join(Rails.root, "spec/fixtures/files/sku.csv")) }
        .to change(Sku, :count).by(7)
    end
  end
end
