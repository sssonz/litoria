require "test_helper"

class Admin::RubricsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_rubrics_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_rubrics_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_rubrics_edit_url
    assert_response :success
  end
end
