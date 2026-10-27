require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get pages_about_url
    assert_response :success
  end

  test "should get coming_soon" do
    get pages_coming_soon_url
    assert_response :success
  end
end
