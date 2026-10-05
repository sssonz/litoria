require "test_helper"

class FandomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fandoms_index_url
    assert_response :success
  end

  test "should get show" do
    get fandoms_show_url
    assert_response :success
  end
end
