Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :offers, only: [:show, :new, :create, :update] do
    resources :reviews, only: [:new, :create]
  end
  resources :offers, only: [:destroy]
  resources :reviews, only: [:update, :destroy]
end
