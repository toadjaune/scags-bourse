Rails.application.routes.draw do
  resources :offers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Normal devise routes for a user login/logout, etc…
  devise_for :users
  # Classic routes for a user
  get 'users', to: 'users#index'

  root 'base#index'
end
