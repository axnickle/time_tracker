Rails.application.routes.draw do

  get 'password_resets/new'
  get 'password_resets/edit'
  root "pages#show", page: "home"
  get '/about',     to: 'pages#about' # do I want this page?
  get '/features',  to: 'pages#features' # do I want this page?
  get '/home',  to: 'pages#home'
  #get '/register', to: 'users#new' # manually mapping user registration to /register instead of /users/new -> therefore not listed under resources
  get '/signup',    to: 'users#new'
  get '/login',     to: 'sessions#new' # links to log in; page for a new session (login)
  post '/login',    to: 'sessions#create' # create a new session (login) ; arranges to route POST request to the Sessions#create action.
  get '/logout',    to: 'sessions#destroy' # deletes a session (log out)
  resources :users, only: [:show, :create, :edit, :update] #note we don't want an index route to show all users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  # resources :account_activations, only: [:edit] #add a route for the account activations 'edit' action

end


# adding a resource to get the standard RESTful actions for sessions
