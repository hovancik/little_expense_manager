Rails.application.routes.draw do
  root 'homes#show'
  resource :homes, only: [:show]
  get '/dashboard', to: 'dashboard#show'
  resources :sessions, only: [:new, :create, :destroy]
  resources :expenses, only: [:create]
  # data for stimulus modals
  namespace :modal do
    resources 'expenses', only: [:new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
