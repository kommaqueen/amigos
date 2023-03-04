Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :places do
<<<<<<< HEAD
    resources :events
    resources :reviews, except: [:destroy, :edit, :update]
  end

  resources :events, only: [:destroy]
  resources :reviews, only: [:destroy]
=======
    resources :events, only: [:new, :create]
  end

  resources :events, only: [:show, :destroy]
>>>>>>> d078dee59fb50bcd3f5c145759a2b8c1f11a2b80

  get "sandbox", to: "pages#sandbox"
  get "search", to: "pages#search"
end
