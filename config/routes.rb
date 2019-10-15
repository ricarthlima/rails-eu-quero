Rails.application.routes.draw do
  
  resources :items
  devise_for :users
  root "dashboard#index"
  
  resources :wishlists
  
  post 'add_name' => "dashboard#add_name"
  
  get "/:username/:link" => "public_view#wishlist"
end
