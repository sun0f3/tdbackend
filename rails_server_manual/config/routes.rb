Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root("users#qwe")

  get '/users', to: 'users#index', as: 'users'
  get '/tasks', to: 'tasks#index'
end
