Rails.application.routes.draw do

  devise_for :users
  resources :profiles, only: %i[show new create edit update destroy] do
    resources :reviews, only: %i[new create]
  end
  resources :products
  resources :photos
  resources :watchlists, only: %i[index create destroy]
  resources :shopping_carts, only: %i[index create destroy]
  resources :orders, only: %i[index new create]
  resources :messages, only: %i[update]
  resources :conversations, only: %i[index create show destroy]
  resources :search, only: %i[index]
  resources :contact_support, only: %i[new create]
  # get '/review-success', to: 'reviews#success', as: 'review_success'
  # get '/order-success', to: 'orders#success', as: 'order_success'
  # get "/top10songs", to: "songs#top_10_songs", as: "top10_songs"
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
