class HomeController < ShopifyApp::AuthenticatedController
  def index
   	@products = ShopifyAPI::Product.find(:all)
   	domain = ShopifyAPI::Shop.current.domain
   	@wishlist = WishlistItem.getUniqueProductsByStore(domain)
  	response.headers['X-Frame-Options'] = "ALLOW-FROM " << domain
  end
end
