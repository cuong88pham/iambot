Rails.application.routes.draw do

  root 'home#login'  
  get 'wellcome', to: 'home#wellcome'
  get 'step2', to: 'home#step2'

  mount ShopifyApp::Engine, at: '/'

  get '/auth/shopify/callback', to: 'home#callback'
  get '/dashboard', to: 'omniauth_callbacks#dashboard'
end
