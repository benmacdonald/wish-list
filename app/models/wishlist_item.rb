class WishlistItem < ApplicationRecord
	validates :email, :domain_name, :name, :productid, :price, presence: true
	validates_uniqueness_of :email, :scope => [:domain_name, :productid]

end
