Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :home, only: [:index]
  resources :categories, only: %i[index new create]
  resources :invoices, only: %i[index new create], as: :transactions
  root 'categories#index'
end
