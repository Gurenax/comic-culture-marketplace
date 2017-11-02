Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: %i[index show new create edit update destroy]
  resources :products
  resources :photos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
