Rails.application.routes.draw do
  devise_for :users
  # root "articles#index"
  root "landing#index"

  resources :articles do
    resources :article_arts do
      
      member do
        patch 'like', to: 'article_arts#upvote'
        patch 'unlike', to: 'article_arts#downvote'
      end
      
      resources :article_art_comments
    end
  end

  resources :article_arts do 
    member do
      # patch :like 
      # patch :dislike

      patch 'like', to: 'article_arts#upvote'
      patch 'unlike', to: 'article_arts#downvote'

    end
  end
  
  resources :users, only: [:show, :edit, :update]
  # resources :districts
end