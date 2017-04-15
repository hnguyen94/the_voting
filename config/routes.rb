# frozen_string_literal: true

Rails.application.routes.draw do

  resources :games do
    member do
      post 'start'
      post 'close'
      get 'show_results', path: 'results'
      delete 'reset_votes'
    end
    resources :players, only: [:create, :destroy] do
      member do
        post 'upvote'
        post 'unvote'
      end
    end
  end

  get 'welcome/index'
  root 'welcome#index'

  resources :users
  get '/signup', to: 'users#new'


  # Login
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
