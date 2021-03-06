ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../dummy/config/environment", __FILE__)

require 'rspec/rails'
require 'acts_as_notifiable'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true
  
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
end
