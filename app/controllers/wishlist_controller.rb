class WishlistController < ApplicationController
  protect_from_forgery prepend: true
  def subscribe
  	subscription = WishlistItem.create(subscription_params)
  	head :ok
  end

  def get_store_subscribers
  	subscriptions = WishlistItem.where(shopid: params[:shopid])
  	render json: subscriptions
  end

  def subscription_params
  	params.permit(:productid, :shopid, :price, :end)
  end
end
