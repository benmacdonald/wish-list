class WishlistController < ApplicationController
  protect_from_forgery prepend: true
  def subscribe
  	subscription = WishlistItem.create(subscription_params)
  	if !subscription.valid?
  		# Update wish list item price and email if it already exists
  		item = WishlistItem.where(email: params[:email], productid: params[:productid], shopid: params[:shopid])
  		item.update(subscription_params)
  	end
  	head :ok
  end

  def get_store_subscribers
  	subscriptions = WishlistItem.where(shopid: params[:shopid])
  	render json: subscriptions
  end

  def get_user_subscriptions
  	subscriptions = WishlistItem.where(email: params[:email])
  	render json: subscriptions
  end

  def subscription_params
  	params.permit(:email, :productid, :shopid, :price, :end)
  end

  def notify_consumers
    wishlists = WishlistItem.where(
      email: params[:email],
      productid: params[:id])
    wishlists = wishlists.where("price >= #{params[:price]} AND end < #{Time.zone.now}")
    ApplicationMailer.notify_consumers(wishlists)
  end

end
