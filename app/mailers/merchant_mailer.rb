class MerchantMailer < ApplicationMailer
	default from: 'decode2017shopify@gmail.com'
 
	def email(shop, product, count, average_price)
		@shop = shop
		@product = product
		@count = count
		@average_price = average_price
		attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")
		# Replace to: with shop owner email
		mail(to: ENV['YOUR_EMAIL'], subject: 'Customers requesting price change on ' << product.title)
	end
end
