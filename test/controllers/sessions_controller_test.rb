require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post '/auth/github/callback', params: OmniAuth.config.mock_auth[:github]
    assert_redirected_to restaurants_url
  end
  test "First time users get new User records" do
    assert_difference('User.count') do
      post '/auth/github/callback', params: OmniAuth.config.add_mock(:github, {uid: '010100101'})

      assert_equal(session[:uid], '010100101')
    end
  end
  test "Logout should clear out session hash" do
    post '/auth/github/callback', params: OmniAuth.config.mock_auth[:github]
    get '/logout'
    assert_not session[:uid]
  end
end
