Rails.application.routes.draw do
  resources :tasks
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get  'casino', to: 'casino#index'
  post 'casino/hit', to: 'casino#hit'

  # Defines the root path route ("/")
  # root "articles#index"
end
