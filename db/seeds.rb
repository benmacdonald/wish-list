# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

WishlistItem.create(email: 'test@email.com',
                    productid: 12877982859,
                    domain_name: 'decode17.myshopify.com',
                    price: 5.60,
                    start: Time.zone.now,
                    end: Time.zone.now,
                    name: 'test',
                    quantity: 2)

WishlistItem.create(email: 'test@email.com',
                    productid: 12877982859,
                    domain_name: 'decode17.myshopify.com',
                    price: 2.90,
                    start: Time.zone.now,
                    end: Time.zone.now,
                    name: 'test two',
                    quantity: 7)

=begin
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
=end
