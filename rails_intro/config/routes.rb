Rails.application.routes.draw do
  root "articles#index"
  resources :articles do
    resources :article_arts, only: %i[create destory]
  end

  resources :articles
  resources :districts
end