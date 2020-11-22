Rails.application.routes.draw do
  devise_for :users

  root to: "artworks#index"

  resources :donation_projects, only: [:index, :new, :create]

  resources :users, only: [:show] do
    member do
      get 'favorite'
    end
  end

  resources :artists, only: [:index, :new, :create, :edit, :update, :show] do
    collection do
      post 'search'
    end
  end

  resources :artworks do
    collection do
      get 'search'
    end
    resources :comments, only: [:create]
  end
  
end
