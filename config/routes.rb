Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'new/create'
  get 'new/destroy'
  root 'static#home'
  resources :users
  resources :attractions, only: [:index, :show]
  post    '/ride',    to: 'attractions#ride'

  get     '/signup',  to: 'users#new'
  get     '/signin',  to: 'sessions#new'
  post    '/signin',  to: 'sessions#create'
  delete  '/signout', to: 'sessions#destroy'
end
