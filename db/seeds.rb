# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |j|
  Shop.create({
      shopify_domain: "decode17_#{j}.myshopify.com",
      shopify_token: 'token'
              })
end

100.times do |i|
  WishlistItem.create(
      {
          email: "test#{i}@mail.com",
          productid: true,
          price: i,
          start: Time.zone.now,
          end: Time.zone.now,
          domain_name:"decode17_#{i%3}.myshopify.com",
          name: "#{i%10}box",
          quantity: i,
      })
end


