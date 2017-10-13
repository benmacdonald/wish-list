class CreateWishlistItems < ActiveRecord::Migration[5.1]
  def change
    create_table :wishlist_items do |t|
      t.text :email
      t.bigint :productid
      t.bigint :shopid
      t.decimal :price
      t.timestamp :start
      t.timestamp :end

      t.timestamps
    end
  end
end
