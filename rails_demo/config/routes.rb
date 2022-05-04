Rails.application.routes.draw do
  
  root 'landing#index'

  devise_for :users
  # devise_for :admins, ActiveAdmin::Devise.config

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

  resources :categories do
    resources :items

    collection do
      get :search
    end
  end

  resources :items do
    collection do
      get :search
    end
  end

  resources :user_items do
    collection do
      get :order_history
    end  
  end

  resources :ratings, only: [:new, :create]

end