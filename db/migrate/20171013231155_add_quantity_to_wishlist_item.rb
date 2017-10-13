class AddQuantityToWishlistItem < ActiveRecord::Migration[5.1]
  def change
    add_column :wishlist_items, :quantity, :integer
  end
end
