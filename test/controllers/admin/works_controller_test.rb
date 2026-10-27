require "test_helper"

class Admin::WorksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_works_index_url
    assert_response :success
  end
end
