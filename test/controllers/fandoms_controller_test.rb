require "test_helper"

class FandomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fandoms_url
    assert_response :success
  end

  test "should get show" do
    get fandom_url(fandoms(:one))
    assert_response :success
  end
end
