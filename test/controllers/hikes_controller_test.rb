require 'test_helper'

class HikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hikes_index_url
    assert_response :success
  end

  test "should get show" do
    get hikes_show_url
    assert_response :success
  end

  test "should get new" do
    get hikes_new_url
    assert_response :success
  end

  test "should get edit" do
    get hikes_edit_url
    assert_response :success
  end

end
