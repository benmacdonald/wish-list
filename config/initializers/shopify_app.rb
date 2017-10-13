ShopifyApp.configure do |config|
  config.application_name = "Wishlist"
  config.api_key = ENV['SHOPIFY_API_KEY']
  config.secret = ENV['SHOPIFY_SECRET']
  config.scope = "read_orders, read_products, write_script_tags"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
  config.scripttags = [
    { event:'onload', src: 'https://e9a36180.ngrok.io/priceButton.js'}
  ]
end
