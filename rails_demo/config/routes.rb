Rails.application.routes.draw do

  root "landing#index"

  scope :profile do
    get '/' => 'profile#index', as: :profile_page 
    get 'edit' => 'profile#edit', as: :edit_profile_page    
    patch 'edit' => 'profile#update'

    devise_scope :user do
      get 'edit/password' => 'devise/registrations#edit', as: :edit_user_registration
    end

  end

  devise_for :users

end
