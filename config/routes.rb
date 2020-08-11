Rails.application.routes.draw do

  root to: 'pages#welcome'

  get '/home' => 'pages#home'

  # Session routes
  get '/login' => 'session#new' # login form

  post '/login' => 'session#create' # form submits, authenticate, create session, redirect or show form with errors

  delete '/login' => 'session#destroy' # logout, i.e. delete session for user

  resources :users

  resources :posts

  resources :photos

end
