Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Normal devise routes for a user login/logout, etc…
  devise_for :users
  # Classic routes for a user
  resources :users

  # Normal routes for an offer
  resources :offers
  # Extra route to purge images
  delete 'offers/:id/images', to: 'offers#purge_images'

  root 'base#index'
end
