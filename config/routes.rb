Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: %i[show new create edit update destroy]
  resources :products
  resources :photos
  resources :shopping_carts, only: %i[index create destroy]
  resources :orders
  
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
