class WishlistItem < ApplicationRecord
	validates :email, :shopid, :productid, :price, presence: true
	validates_uniqueness_of :email, :scope => [:shopid, :productid]
end
