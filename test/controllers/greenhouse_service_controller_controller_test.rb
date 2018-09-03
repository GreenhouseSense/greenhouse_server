require 'test_helper'

class GreenhouseServiceControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get greenhouse_service_controller_login_url
    assert_response :success
  end

  test "should get logout" do
    get greenhouse_service_controller_logout_url
    assert_response :success
  end

end
