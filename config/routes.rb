Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Normal devise routes for a user login/logout, etc…
  devise_for :users
  root 'base#index'
end
