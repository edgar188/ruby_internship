Rails.application.routes.draw do
  require 'sidekiq/web'

  root 'landing#index'

  authenticated :admin_user do
    mount Sidekiq::Web, at: '/sidekiq'
  end

  namespace :api do
    namespace :v1 do
      post '/registration', to: 'authentication#registration'
      post '/auth', to: 'authentication#auth'
      post '/admin_auth', to: 'authentication#admin_auth'

      resources :users do
        resources :friendships, only: [:create] do
          collection do
            get :accept, :decline
          end
        end
      end

      resources :notifications, only: [:index, :destroy] do
        collection do
          get :delete_all
        end
      end

      get '/current', to: 'users#current'
      resources :categories
      resources :items
      get '/*a', to: 'application#notfound'
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

  resources :conversations, only: [:create, :new] do
    resources :messages, only: [:index, :create]
  end

  resources :conversation_users do
    collection do
      post :add_member
    end
  end

end