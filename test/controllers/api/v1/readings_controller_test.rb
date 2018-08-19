require 'test_helper'

class Api::V1::ReadingsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get api_v1_readings_add_url
    assert_response :success
  end

  test "should get get_last" do
    get api_v1_readings_get_last_url
    assert_response :success
  end

  test "should get get_weeks" do
    get api_v1_readings_get_weeks_url
    assert_response :success
  end

  test "should get get_months" do
    get api_v1_readings_get_months_url
    assert_response :success
  end

  test "should get get_years" do
    get api_v1_readings_get_years_url
    assert_response :success
  end

end
