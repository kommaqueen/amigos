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
  end
  resources :comments, only: [:destroy]
  resources :reviews, only: [:destroy]
  resources :events, only: [:show, :edit, :update, :destroy]

  get "sandbox", to: "pages#sandbox"
  get "search", to: "pages#search"
  get "dashboard", to: "pages#dashboard"
end
