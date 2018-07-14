require 'test_helper'

RSpec.describe UploadsController, type: :controller do
  before :each do
    @file = fixture_file_upload('spec/fixtures/files/csv_files.zip', 'zip')
  end

  describe "post #parse" do
    it "can upload a zip file" do
      post :import, params: {upload: {file: @file}}
      expect(response).to have_http_status :found
      expect(response).to redirect_to uploads_path
      expect(flash[:notice]).to include 'Successfully started downloading'
    end
  end
end
