require 'test_helper'

class ShiftControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shift_index_url
    assert_response :success
  end

  test "should get show" do
    get shift_show_url
    assert_response :success
  end

  test "should get new" do
    get shift_new_url
    assert_response :success
  end

  test "should get create" do
    get shift_create_url
    assert_response :success
  end

  test "should get update" do
    get shift_update_url
    assert_response :success
  end

  test "should get destroy" do
    get shift_destroy_url
    assert_response :success
  end

end
