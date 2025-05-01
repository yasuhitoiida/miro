require "test_helper"

class ShortPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get short_posts_new_url
    assert_response :success
  end

  test "should get create" do
    get short_posts_create_url
    assert_response :success
  end
end
