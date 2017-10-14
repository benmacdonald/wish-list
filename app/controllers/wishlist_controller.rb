class WishlistController < ApplicationController
  protect_from_forgery prepend: true
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
  	render json: subscriptions
  end

  def get_user_subscriptions
  	subscriptions = WishlistItem.where(email: params[:email])
  	render json: subscriptions
  end

  def subscription_params
  	params.permit(:email, :domain_name, :name, :quantity, :price, :end, :quantity, :productid)
  end

  def notify_consumers
    wishlists = WishlistItem.where(name: params[:vendor], productid: params[:id])
    #.where("price >= #{params[:price]} AND end < #{Time.zone.now}")
    print(wishlists)
    ApplicationMailer.notify_consumers(wishlists)
  end

end
