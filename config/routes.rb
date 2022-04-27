Rails.application.routes.draw do
  get 'entities/index'
  devise_for :users
  resources :groups
  resources :entities
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "groups#index"
end
