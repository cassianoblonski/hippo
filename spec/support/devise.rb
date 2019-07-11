# frozen_string_literal: true
module SessionMacros
  def login(person)
    @request.env['devise.mapping'] = Devise.mappings[:person]
    sign_in person
  end

  def login_person
    before { login create :person }
  end
end

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Warden::Test::Helpers, type: :feature
  config.extend SessionMacros, type: :controller
  config.before(type: :request) { Warden.test_mode! }
end
