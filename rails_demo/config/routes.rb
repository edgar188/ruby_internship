Rails.application.routes.draw do
  
  root 'landing#index'

  namespace :api do
    namespace :v1 do
      resources :users
      post '/auth', to: 'authentication#auth'
      post '/admin_auth', to: 'authentication#admin_auth'
      post '/registration', to: 'authentication#registration'
      get '/*a', to: 'application#not_found' 
    end
  end

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
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
      get :export_csv, as: :export
    end
  end

  resources :categories do
    resources :items

    collection do
      get :search
      get 'export' => 'categories#export_sample_csv', as: :export
      post :import
    end
  end

  resources :items, except: [:index] do
    member do
      get :export_pdf, as: :export
    end
    
    collection do
      get :search
    end
  end

  resources :user_items do
    collection do
      get :order_history
      get :buy_all
      get :delete_all
    end  
  end

  resources :ratings, only: [:new, :create]

end