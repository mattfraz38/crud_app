Rails.application.routes.draw do
  root to: "static_pages#index"

  get 'about', to: 'static_pages#about', as: 'about'

  devise_for :users
  resources :users, only: [ :index, :show ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
