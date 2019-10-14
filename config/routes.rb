Rails.application.routes.draw do
  
  resources :items
  devise_for :users
  root "dashboard#index"
  
  resources :wishlists
end
