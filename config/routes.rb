Rails.application.routes.draw do
  devise_for :bot_shops

  root 'home#index'

end
