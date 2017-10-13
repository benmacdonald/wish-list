class AddNameToWishlistItem < ActiveRecord::Migration[5.1]
  def change
    add_column :wishlist_items, :name, :string
  end
end
