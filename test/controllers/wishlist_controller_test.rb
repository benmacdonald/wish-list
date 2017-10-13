require 'test_helper'

class WishlistControllerTest < ActionDispatch::IntegrationTest
  test "should get subscribe" do
    post wishlist_subscribe_url
    assert_response :success
  end

end
