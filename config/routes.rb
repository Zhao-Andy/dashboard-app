Rails.application.routes.draw do
  # home page
  get '/' => 'pages#home'

  # users
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # employees
  namespace :api do
    get '/employees' => 'employees#index'
    post '/employees' => 'employees#create'
    patch '/employees/:id' => 'employees#update'
    delete '/employees/:id' => 'employees#destroy'
  end
end
