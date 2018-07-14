class UploadsController < ApplicationController
  require 'zip'

  def index
  end

  def import
    zip_file = require_params['file'].tempfile

    Zip::File.open(zip_file) do |zipfile|
      zipfile.each{ |file| extract_file(file) }
      parse_files
    end

    redirect_to(uploads_path, notice: 'Successfully started downloading')
  end

  FILENAMES = %w(suppliers.csv sku.csv)

  private

  def require_params
    params.require(:upload)
  end

  def extract_file(file)
    file.extract(file_path(file.name)) if valid_file_name(file.name) && valid_path(file.name)
  end

  def valid_file_name(file_name)
    FILENAMES.include? file_name
  end

  def valid_path(file_name)
    File.delete(file_path(file_name)) if File.exist?(file_path(file_name))
  end

  def file_path(file_name)
    File.join(Rails.root, "tmp/#{file_name}")
  end

  def parse_files
    FILENAMES.each do |file_name|
      name = file_name[/[^.]+/]
      "#{name.singularize.capitalize}UploadJob".constantize.perform_later(file_path(file_name)) if File.exist?(file_path(file_name))
    end
  end
end
