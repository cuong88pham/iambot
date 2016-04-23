Rails.application.routes.draw do

<<<<<<< HEAD
  root 'home#login'
  get 'wellcome', to: 'home#wellcome'
  get 'step2', to: 'home#step2'
  get '/conversation', to: 'home#index'
=======
  root 'home#index'  

  get '/welcome', to: 'welcome#index'
  get '/welcome/step1', to: 'welcome#step1'
  get '/welcome/step2', to: 'welcome#step2'
>>>>>>> 0ef63667c06562c2bf4bce1a555626701e5abb5e

  mount ShopifyApp::Engine, at: '/'

  get '/auth/shopify/callback', to: 'home#callback'
  get '/dashboard', to: 'omniauth_callbacks#dashboard'
end
