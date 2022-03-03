Rails.application.routes.draw do
  resources :favourites
  get 'users/index', to: 'users#index', as: :users
  get 'users/show/:id', to: 'users#show', as: :user
  post 'users/user_create', to: 'users#user_create', as: :user_create
  get 'users/new', to: 'users#new', as: :new_user
  get 'users/edit/:id', to: 'users#edit', as: :edit_user
  patch 'users/update_user', to: 'user#update_user', as: :update_user
  delete 'users_destroy/:id' => 'users#destroy', as: :users_destroy
  root 'welcome_pages#home'
  resources :books
  resources :authors
  resources :categories
  devise_for :users, :controllers => { registrations: 'registrations' }
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
