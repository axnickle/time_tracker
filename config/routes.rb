Rails.application.routes.draw do
  get '/register', to: 'users#new' # manually mapping user registration to /register instead of /users/new -> therefore not listed under resources
  root 'users#new'
  resources :users, only: [:show, :create, :edit, :update] #note we don't want an index route to show all users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
