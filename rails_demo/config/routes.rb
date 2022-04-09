Rails.application.routes.draw do

  devise_for :users
  root "landing#index"

  resources :users, only: [:show, :edit, :update]
end
