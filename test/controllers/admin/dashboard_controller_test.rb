require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = User.create!(
      username: "dashboard_test_admin",
      email: "dashboard_admin@example.com",
      password: "testpassword123",
      role: "admin"
    )

    post login_path, params: {
      email: @admin.email,
      password: "testpassword123"
    }

    assert_redirected_to admin_root_path
  end

  test "should get index" do
    get admin_root_path
    assert_response :success
  end
end
