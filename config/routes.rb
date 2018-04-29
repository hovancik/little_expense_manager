Rails.application.routes.draw do
  root 'homes#show'
  resource :homes, only: [:show]
  get '/dashboard', to: 'dashboard#show'
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
