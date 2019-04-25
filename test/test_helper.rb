ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  setup do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      uid: users(:one).uid,
      info:{
        name: users(:one).name,
        email: users(:one).email
      }
      })
  end

  def login_with(provider)
    post "/auth/#{provider}/callback", params: OmniAuth.config.mock_auth[provider.to_sym]
  end

  # Add more helper methods to be used by all tests here...
end
