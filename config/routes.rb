Rails.application.routes.draw do

  root 'home#index'
  
  get '/auth/shopify/callback', to: 'home#callback'
  get '/products', to: 'home#products'

  mount ShopifyApp::Engine, at: '/'
end
