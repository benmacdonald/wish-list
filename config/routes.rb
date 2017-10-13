Rails.application.routes.draw do
  post 'wishlist/subscribe'
  get 'wishlist/get_store_subscribers'
  get 'wishlist/get_user_subscriptions'
  post 'wishlist/notify_wishlisters'

  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
