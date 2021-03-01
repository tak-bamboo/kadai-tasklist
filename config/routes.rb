Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  root to: 'tasks#index'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

#  resources :tasks,except:[:index]
  resources :tasks
  resources :users, only: [:new,:create]

end