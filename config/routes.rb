Rails.application.routes.draw do
  get 'rooms/show'
  get 'application/index'


  root 'static_pages#home'
  
  
  get 'static_pages/help'
  get 'layouts/application'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  # root  'users#show'
  # get 'users/show'
  resources :users, :only => [:new, :create, :show, :edit, :index, :destroy, :update]
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  delete  '/logout', to: 'sessions#destroy'
  resources :sessions, only: %i[new create destroy]
  # resources :users, only: %i[show new create edit  index]
  resources :account_activations, only: [:edit]
  resources :feeds, only: %i[create destroy]
  mount ActionCable.server => '/cable'


# delete '/logout', to: 'sessions#destroy', as: :logout
# get '/auth/:provider/callback', to: 'sessions#create'

# root to: 'stories#index'

end
