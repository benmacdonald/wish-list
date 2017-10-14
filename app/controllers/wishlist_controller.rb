class WishlistController < ApplicationController
  protect_from_forgery with: :null_session
  def subscribe
  	subscription = WishlistItem.create(subscription_params)
  	if !subscription.valid?
  		# Update wish list item price and email if it already exists
  		item = WishlistItem.where(email: params[:email], productid: params[:productid], domain_name: params[:domain_name])
  		item.update(subscription_params)
  	end
  	head :ok
  end

  def get_store_subscribers
  	subscriptions = WishlistItem.where(domain_name: params[:domain_name])
    response.headers['X-Frame-Options'] = "ALLOW-FROM " << params[:domain_name]
  	render json: subscriptions
  end

  def get_user_subscriptions
  	subscriptions = WishlistItem.where(email: params[:email])
  	render json: subscriptions
  end

  # def subscription_params
  # 	#params.permit(:email, :domain_name, :name, :quantity, :price, :end, :quantity, :productid, :variants)
  # end

  def notify_consumers
    wishlists = WishlistItem.where(productid: params[:id]).where("price > ?", params['variants']['price'])
    ApplicationMailer.notify_consumers(wishlists).deliver_now
    render json: wishlists
  end

  # GET /wishlist
  def index
    @wishlist_items = WishlistItem.where(domain_name: params[:shop])
    response.headers['X-Frame-Options'] = "ALLOW-FROM " << params[:shop]
  end

  # Finds ShopifyAPI::Product objects from a users WishlistItem's.
  def get_wishlisted_products
    wishlist_items = WishlistItem.where(email: params[:email])
    product_ids = wishlist_items.map{ |item| item.productid }
    shop_info = Shop.where(shopify_domain: params[:shop]).first
    session = ShopifyAPI::Session.new(shop_info.shopify_domain, shop_info.shopify_token)
    ShopifyAPI::Base.activate_session(session)
    products = product_ids.map{ |id| ShopifyAPI::Product.find(id) }
    response.headers['X-Frame-Options'] = "ALLOW-FROM " << shop_info.shopify_domain
    render json: products
  end

end
