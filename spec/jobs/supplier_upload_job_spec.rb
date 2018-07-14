require 'test_helper'

RSpec.describe SupplierUploadJob do
  describe "suppliers save in db" do
    it 'creates suppliers' do
      expect { subject.perform(File.join(Rails.root, "spec/fixtures/files/suppliers.csv")) }
        .to change(Supplier, :count).by(7)
    end
  end
end
