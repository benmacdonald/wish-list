require 'test_helper'

class WishlistControllerTest < ActionDispatch::IntegrationTest
  test "should get subscribe" do
    post wishlist_subscribe_url
    assert_response :success
  end

  test "should email customers" do
    post wishlist_notify_consumers_url, params: {name: "decode17", productid: 1}
    assert_redirected_to '/'
  end

end
