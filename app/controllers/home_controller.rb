class HomeController < ApplicationController
  def index
    @wishlist = WishlistItem.getUniqueProductsByStore(params[:shop])
    response.headers['X-Frame-Options'] = "ALLOW-FROM " << params[:shop]
    puts @wishlist
  end
end
