Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]

  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]

  post '/ride/:id', to: 'rides#create'

  resources :sessions, only: [:create]

  get '/signin', to: 'sessions#new'

  post 'sessions/create', to: 'sessions#create'

  get '/sessions/delete', to: 'sessions#delete'



  root 'welcome#home'

end
