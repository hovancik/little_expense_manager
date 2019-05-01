Rails.application.routes.draw do
  root 'homes#show'
  resource :homes, only: [:show]
  get '/dashboard', to: 'dashboard#show'
  resources :sessions, only: [:new, :create, :destroy]
  resources :expenses, only: [:create, :update, :destroy]
  resources :accounts, only: [:update] do
    resources :expenses, only: [:index]
  end
  # data for stimulus load_modal_controller
  namespace :modal do
    resources :accounts, only: [:edit]
    resources :expenses, only: [:new, :edit]
  end
  # data for stimulus loader_controller
  namespace :loader do
    resources :accounts, only: [] do
      post :data
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
