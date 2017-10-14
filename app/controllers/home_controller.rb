class HomeController < ApplicationController
  def index
    @wishlist = WishlistItem.getUniqueProductsByStore(params[:shop])
    shop_info = Shop.where(shopify_domain: params[:shop]).first
    session = ShopifyAPI::Session.new(shop_info.shopify_domain, shop_info.shopify_token)
    ShopifyAPI::Base.activate_session(session)
    @products = ShopifyAPI::Product.all
    puts @products
    response.headers['X-Frame-Options'] = "ALLOW-FROM " << params[:shop]
    puts @wishlist
  end
end
