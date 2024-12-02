Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"

  resources :users, only: [:show]

  resources :special_offers, only: [:index, :show, :new, :create, :update] do
    resources :reviews, only: [:new, :create]
  end
  resources :special_offers, only: [:destroy]
  resources :reviews, only: [:update, :destroy]

  # Steve's add
  resources :locations, only: [:index]

  # Chaf's add for accept/decline
  resources :invitations, only: [:update]

end
