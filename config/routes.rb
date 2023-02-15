Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :home, only: [:index]
  resources :categories, only: [:index, :new, :create]
  resources :invoices, only: [:index, :new, :create], as: :transactions
  resources :records, only: [:create]
  root 'categories#index'
end
