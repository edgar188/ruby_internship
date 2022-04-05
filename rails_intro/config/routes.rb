Rails.application.routes.draw do
  # root "articles#index"
  root "landing#index"

  resources :articles do
    resources :article_arts do
      resources :article_art_comments
    end
  end

  resources :article_arts
  # resources :districts
end