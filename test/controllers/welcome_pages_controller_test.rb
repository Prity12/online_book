require "test_helper"

class WelcomePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get welcome_pages_home_url
    assert_response :success
  end
end
