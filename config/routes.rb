Rails.application.routes.draw do
  resources :messages
  resources :conversations
  devise_for :users
  resources :profiles, only: %i[show new create edit update destroy] do
    resources :reviews #, only: %i[index show new create edit update destroy]
  end
  resources :products
  resources :photos
  resources :watchlists, only: %i[index create destroy]
  resources :shopping_carts, only: %i[index create destroy]
  resources :orders, only: %i[index new create]
  
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
