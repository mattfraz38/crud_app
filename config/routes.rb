Rails.application.routes.draw do
  root to: "static_pages#index"

  get 'about', to: 'static_pages#about', as: 'about'

  devise_for :users
  resources :users, only: [ :index, :show ] do
    resources :articles
  end
  resources :articles, only: [ :index, :show, :new, :create ]
  
  get '/users/:id', to: 'users#show', as: :user_root
  
  get 'search', to: 'users#search'
end
