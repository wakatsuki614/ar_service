Rails.application.routes.draw do
  get 'sessions/new'
  
  get 'signup', to: 'users#new'

  resources :users, only: [:index, :show, :create, :edit, :update, :destroy]
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :rooms
  
  post 'reservations/confirm'
  post 'reservations/back'
  post 'reservations/complete'
  resources :reservations
  
  get 'search' => 'rooms#search', as: 'search'
  get 'search' => 'rooms#search_area', as: 'search_area'

  get '/', to: 'users#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
