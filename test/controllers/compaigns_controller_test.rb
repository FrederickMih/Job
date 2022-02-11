require 'test_helper'

class CompaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compaign = compaigns(:one)
  end

  test "should get index" do
    get compaigns_url
    assert_response :success
  end

  test "should get new" do
    get new_compaign_url
    assert_response :success
  end

  test "should create compaign" do
    assert_difference('Compaign.count') do
      post compaigns_url, params: { compaign: { caller_number: @compaign.caller_number, name: @compaign.name, start_date: @compaign.start_date, status: @compaign.status, user_id: @compaign.user_id } }
    end

    assert_redirected_to compaign_url(Compaign.last)
  end

  test "should show compaign" do
    get compaign_url(@compaign)
    assert_response :success
  end

  test "should get edit" do
    get edit_compaign_url(@compaign)
    assert_response :success
  end

  test "should update compaign" do
    patch compaign_url(@compaign), params: { compaign: { caller_number: @compaign.caller_number, name: @compaign.name, start_date: @compaign.start_date, status: @compaign.status, user_id: @compaign.user_id } }
    assert_redirected_to compaign_url(@compaign)
  end

  test "should destroy compaign" do
    assert_difference('Compaign.count', -1) do
      delete compaign_url(@compaign)
    end

    assert_redirected_to compaigns_url
  end
end
