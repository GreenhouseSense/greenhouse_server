require 'test_helper'

class Api::V1::DecisionsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get api_v1_decisions_add_url
    assert_response :success
  end

  test "should get get_last" do
    get api_v1_decisions_get_last_url
    assert_response :success
  end

  test "should get get_weeks" do
    get api_v1_decisions_get_weeks_url
    assert_response :success
  end

  test "should get get_months" do
    get api_v1_decisions_get_months_url
    assert_response :success
  end

  test "should get get_years" do
    get api_v1_decisions_get_years_url
    assert_response :success
  end

end
