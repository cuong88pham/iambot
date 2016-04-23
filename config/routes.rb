Rails.application.routes.draw do

  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'

  get '/auth/shopify/callback', to: 'home#callback'
  get '/dashboard', to: 'omniauth_callbacks#dashboard'

end
