Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :places do
    resources :events, only: [:new, :create]
    resources :reviews, except: [:destroy, :edit, :update]
    resources :comments, except: [:destroy, :edit, :update]
    resources :check_ins, only: [:new, :create]
    member do
      get "favoriter", to: "places#favoriter"
      # get "unfavorite", to: "places#unfavorite"
    end
  end

  resources :comments, only: [:destroy]
  resources :reviews, only: [:destroy]

  resources :events, only: [:show, :edit, :update, :destroy] do
    resources :invites, only: [:new, :create]
    resources :attendances, only: [:new, :create]
  end

  resources :users, only: [:show, :index, :edit, :update] do
    resources :friendships, only: [:create]
  end

  resources :friendships, only: [:show, :index] do
    resources :messages, only: [:create]
  end
  # resources :favorites, only: [:create]
  # resources :favorites, only: [:destroy]

  resources :invites, only: [:update]
  resources :friendships, only: [:update]


  get "sandbox", to: "pages#sandbox"
  get "search", to: "pages#search", as: :search

  get "dashboard", to: "pages#dashboard"
end
