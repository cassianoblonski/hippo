require 'simplecov'

SimpleCov.start 'rails' do
  add_filter %r{^/app/channels/application_cable/channel}
  add_filter %r{^/app/channels/application_cable/connection}
  add_filter %r{^/app/jobs/application_job}
  add_filter %r{^/app/mailers/application_mailer}
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
