Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :places do
    resources :events, only: [:new, :create]
  end

  resources :events, only: [:show, :destroy]

  get "sandbox", to: "pages#sandbox"
end
