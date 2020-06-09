Rails.application.routes.draw do
  devise_for :users
  root "reservations#index"
  resources :users, only: [:edit, :update, :destroy]
  resources :reservations, only: [:index, :new, :create, :edit, :update,]


end
