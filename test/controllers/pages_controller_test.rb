require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get about_url
    assert_response :success
  end

  test "should get coming_soon" do
    get coming_soon_url
    assert_response :success
  end
end
