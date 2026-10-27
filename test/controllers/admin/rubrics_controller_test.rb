require "test_helper"

class Admin::RubricsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = User.create!(
      username: "rubrics_test_admin",
      email: "rubrics_admin@example.com",
      password: "testpassword123",
      role: "admin"
    )

    post login_path, params: {
      email: @admin.email,
      password: "testpassword123"
    }

    assert_redirected_to admin_root_path

    @rubric = rubrics(:one)
  end

  test "should get index" do
    get admin_rubrics_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_rubric_url
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_rubric_url(@rubric)
    assert_response :success
  end
end
