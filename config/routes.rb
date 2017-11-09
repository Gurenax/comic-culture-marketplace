Rails.application.routes.draw do

  # Users
  devise_for :users, controllers: { registrations: 'registrations', passwords: 'passwords' }

  # User Profiles
  resources :profiles, only: %i[show new create edit update destroy] do
    resources :reviews, only: %i[new create]
  end

  # Products
  resources :products
  # Product Categories
  get '/categories/comic-books-and-graphic-novels', to: 'products#books', as: 'product_books'
  get '/categories/toys-and-collectibles', to: 'products#toys', as: 'product_toys'
  get '/categories/costumes', to: 'products#costumes', as: 'product_costumes'
  get '/categories/clothing-and-apparel', to: 'products#apparel', as: 'product_apparel'
  # Product Photos
  resources :photos
  # Product Search
  resources :search, only: %i[index]

  # Shopping Cart
  resources :shopping_carts, only: %i[index create destroy]
  # Watchlist
  resources :watchlists, only: %i[index create destroy]
  # Orders
  resources :orders, only: %i[index new create]

  # Messages
  resources :conversations, only: %i[index create show destroy]
  resources :messages, only: %i[update]

  # Contact Support
  resources :contact_support, only: %i[new create]

  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
