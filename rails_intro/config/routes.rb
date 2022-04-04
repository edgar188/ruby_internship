Rails.application.routes.draw do
  root "articles#index"
  resources :articles do
    resources :article_arts do
      resources :article_art_comments
    end
  end

  resources :articles
  resources :districts
end