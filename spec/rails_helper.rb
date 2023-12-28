# frozen_string_literal: true

require 'spec_helper'
require 'json_matchers/rspec'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'swagger_helper'

%w[api_doc support].each do |dir|
  Dir[Rails.root.join('spec', dir, '**', '*.rb')].each do |file|
    require file unless file[/\A.+_spec\.rb\z/]
  end
end

JsonMatchers.schema_root = 'spec/support/schemas/api/v1'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = Rails.root.join('spec/fixtures').to_s
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
