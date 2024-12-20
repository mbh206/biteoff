Rails.application.routes.draw do
  devise_for :users
  root to: "pages#index"

  resources :users, only: [:show]

  resources :special_offers, only: [:index, :show, :new, :create, :update] do
    resources :reviews, only: [:new, :create]
  end

  resources :special_offers, only: [:destroy]
  resources :reviews, only: [:update, :destroy]

  resources :voting_sessions, only: [:show, :create, :update, :destroy] do
    resources :votes, only: [:update,:create]
  end

  resources :votes, only: [:destroy]
  post "/createsessioninbackground/:special_offer_id", to: "voting_sessions#csib", as: "csib"
  resources :voters, only: [:destroy]
  # Steve's add
  resources :locations, only: [:index]

  # Chaf's add for accept/decline
  resources :invitations, only: [:update,:create]
  resources :voters, only: [:create]
  resources :collections, only: [:update, :create]

end
