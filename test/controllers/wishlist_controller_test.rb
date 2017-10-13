require 'test_helper'

class WishlistControllerTest < ActionDispatch::IntegrationTest
  test "should get subscribe" do
    get wishlist_subscribe_url
    assert_response :success
  end

end
