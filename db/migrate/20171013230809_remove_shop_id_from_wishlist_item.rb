class RemoveShopIdFromWishlistItem < ActiveRecord::Migration[5.1]
  def change
    remove_column :wishlist_items, :shopid, :integer
  end
end
