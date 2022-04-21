Rails.application.routes.draw do

  root 'landing#index'
  devise_for :users
  ActiveAdmin.routes(self)

  scope :profile do
    resources :profile, only: [:edit, :update]
    get '/' => 'profile#index', as: :profile_page 
    get 'edit/account' => 'profile#edit', as: :edit_user_account

    devise_scope :user do
      get 'edit/password' => 'devise/registrations#edit', as: :edit_user_account_password
    end

  end
  
  resources :users, only: [:index, :show] do
    collection do
      get :search
    end
  end


end