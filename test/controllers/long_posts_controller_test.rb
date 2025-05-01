require "test_helper"

class LongPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get long_posts_new_url
    assert_response :success
  end

  test "should get create" do
    get long_posts_create_url
    assert_response :success
  end
end
