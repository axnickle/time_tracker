Rails.application.routes.draw do

  get 'password_resets/new'
  get 'password_resets/edit'
  root "pages#show", page: "home"
  get '/about',     to: 'pages#about' # do I want this page?
  get '/features',  to: 'pages#features' # do I want this page?
  get '/home',      to: 'pages#home'
  #get '/register', to: 'users#new' # manually mapping user registration to /register instead of /users/new -> therefore not listed under resources
  get '/signup',    to: 'users#new'
  get '/login',     to: 'sessions#new' # links to log in; page for a new session (login)
  post '/login',    to: 'sessions#create' # create a new session (login) ; arranges to route POST request to the Sessions#create action.
  get '/logout',    to: 'sessions#destroy' # deletes a session (log out)
  resources :users  #using all the actions
  resources :projects, except: [:destroy]
  resources :tasks do
      resources :task_entries
  end
  resources :password_resets,     only: [:new, :create, :edit, :update]
  #   resources :account_activations, only: [:edit] #add a route for the account activations 'edit' action
  # lines 18 brings the index
 resources :customers, except: [:destroy]
  # start nesting from line 18 - using relationships to creates paths
  resources :customers do # 'resouce' refers to the controller; all the RESTful routes map to companies
    resources :projects do
      resources :tasks do
        resources :task_entries
      end
    end
  end
end

#   resources :task_entries do
#         get :start_time
#       end
#   resources :task_entries do
#         post :stop_time
#       end
