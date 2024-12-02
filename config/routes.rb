Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"

  resources :users, only: [:show]

  resources :special_offers, only: [:index, :show, :new, :create, :update] do
    resources :reviews, only: [:new, :create]
  end

  resources :special_offers, only: [:destroy]
  resources :reviews, only: [:update, :destroy]

  resources :special_offers, only: [] do
    resources :special_offers_lists, only: [:new, :create]
  end

  resources :special_offers, only: [] do
    resources :offers_collections, only: [:new, :create]
  end

  # Steve's add
  resources :locations, only: [:index]


end
