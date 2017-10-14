class HomeController < ShopifyApp::AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @wishlist = WishlistItem.getUniqueProductsByStore(params[:shop])
    response.headers['X-Frame-Options'] = "ALLOW-FROM " << shop_info.shopify_domain
    puts @wishlist
  end
end
