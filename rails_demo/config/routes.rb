Rails.application.routes.draw do

  resources :categories do
    resources :items
  end

  root 'landing#index'

  scope :profile do
    resources :profile, only: [:edit, :update]
    get '/' => 'profile#index', as: :profile_page 
    get 'edit/account' => 'profile#edit', as: :edit_user_account

    devise_scope :user do
      get 'edit/password' => 'devise/registrations#edit', as: :edit_user_registration
    end

  end
  
  resources :users, only: [:index, :show] do
    collection do
      get :search
    end
  end

  devise_for :users
  ActiveAdmin.routes(self)

end