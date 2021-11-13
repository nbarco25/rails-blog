Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  resources :articles do
    resources :comments
  end

  resources :users do
    resources :relationships, only: [:create]
  end

  resources :relationships, only: [:destroy]

end
