Rails.application.routes.draw do
  devise_for :bot_shops

  root 'home#login'  
  get 'wellcome', to: 'home#wellcome'
end
