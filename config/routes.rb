Rails.application.routes.draw do
  resources :favourites
  get 'users/index', to: 'users#index', as: :users
  get 'users/show', to: 'users#show', as: :user
  get 'users/new', to: 'users#new', as: :new_user
  get 'users/edit', to: 'users#edit', as: :edit_user
  delete 'users/:id' => 'users#destroy'
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
