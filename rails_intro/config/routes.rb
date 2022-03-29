Rails.application.routes.draw do
  root "districts#index"
  resources :articles, :districts
end