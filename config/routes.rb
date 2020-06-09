Rails.application.routes.draw do
  devise_for :users
  root "reservations#index"
  resources :users, only: [:index, :edit, :update,]
  resources :reservations, only: [:index, :new, :create, :edit, :update,]


end
