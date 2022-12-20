require "test_helper"

class Public::PicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_pictures_new_url
    assert_response :success
  end

  test "should get index" do
    get public_pictures_index_url
    assert_response :success
  end

  test "should get show" do
    get public_pictures_show_url
    assert_response :success
  end
end
