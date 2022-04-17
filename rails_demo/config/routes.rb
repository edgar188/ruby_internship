Rails.application.routes.draw do

  root "landing#index"

  scope :profile do
    resources :profile, only: [:edit, :update] 
    get '/' => 'profile#index', as: :profile_page 
    get 'edit/account' => 'profile#edit', as: :edit_user_account

    devise_scope :user do
      get 'edit/password' => 'devise/registrations#edit', as: :edit_user_registration
    end

  end

  devise_for :users
  resources :users, only: [:index, :show, :search]
  ActiveAdmin.routes(self)

end