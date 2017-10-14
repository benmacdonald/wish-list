class HomeController < ShopifyApp::AuthenticatedController
  def index
   	@products = ShopifyAPI::Product.find(:all)
  	@webhooks = ShopifyAPI::Webhook.find(:all)
  	response.headers['X-Frame-Options'] = "ALLOW-FROM " << ShopifyAPI::Shop.current.domain
  end
end
