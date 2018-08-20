require 'test_helper'

class Api::V1::ActionsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get api_v1_actions_add_url
    assert_response :success
  end

  test "should get get" do
    get api_v1_actions_get_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_actions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_actions_destroy_url
    assert_response :success
  end

end
