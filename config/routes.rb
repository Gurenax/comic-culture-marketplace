Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: %i[show new create edit update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
