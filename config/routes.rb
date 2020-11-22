Rails.application.routes.draw do
  devise_for :users

  root to: "artworks#index"

  resources :users, only: [:show] do
    member do
      get 'favorite'
    end
  end
  
end
