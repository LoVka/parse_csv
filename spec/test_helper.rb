ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'spec_helper'
require 'rspec/rails'
require 'sidekiq/testing'

# Sidekiq::Testing.inline!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)

  config.before :suite do
    DatabaseCleaner.clean_with(:deletion)
  end

  config.after :each do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :deletion : :truncation
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
