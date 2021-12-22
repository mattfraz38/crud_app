Rails.application.routes.draw do
  root to: "static_pages#index"

  get 'about', to: 'static_pages#about', as: 'about'

  devise_for :users
  resources :users, only: [ :index, :show ] do
    resources :articles
  end
  resources :articles, only: [ :index, :show, :new, :create ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
