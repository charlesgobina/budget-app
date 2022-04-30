Rails.application.routes.draw do
  devise_for :users
  resources :groups
  resources :entities
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  devise_scope :user do 
    authenticated :user do 
      root 'groups#index', as: :authenticated_root 
    end
    unauthenticated do 
      root 'users#index', as: :unauthenticated_root 
    end 
  end
end
