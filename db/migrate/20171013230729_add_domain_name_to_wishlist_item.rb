class AddDomainNameToWishlistItem < ActiveRecord::Migration[5.1]
  def change
    add_column :wishlist_items, :domain_name, :string
  end
end
