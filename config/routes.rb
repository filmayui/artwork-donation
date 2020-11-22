Rails.application.routes.draw do
  devise_for :users

  root to: "artworks#index"

  resources :donation_projects, only: [:index, :new, :create]

  resources :users, only: [:show] do
    member do
      get 'favorite'
    end
  end
  
end
