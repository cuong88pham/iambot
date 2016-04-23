Rails.application.routes.draw do

  root 'home#index'
  get '/conversation', to: 'home#index'

  get '/products', to: 'home#products'

  get '/notifications', to: 'notifications#index'

  get '/users', to: 'users#index'

  get '/welcome', to: 'welcome#index'
  get '/welcome/step1', to: 'welcome#step1'
  get '/welcome/step2', to: 'welcome#step2'
  get '/welcome/step3', to: 'welcome#step3'


  # Facebook messenger callback
  get '/webhook', to: 'messenger#verify'
  post '/webhook', to: 'messenger#reciveMessage'
  
  mount ShopifyApp::Engine, at: '/'

  get '/auth/shopify/callback', to: 'home#callback'
  get '/dashboard', to: 'omniauth_callbacks#dashboard'
end
