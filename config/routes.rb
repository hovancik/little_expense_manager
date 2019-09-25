Rails.application.routes.draw do
  root 'homes#show'
  resource :homes, only: [:show]
  get :dashboard, to: 'dashboard#show'
  resources :sessions, only: [:new, :create, :destroy]
  resources :expenses, only: [:create, :update, :destroy]
  resources :accounts, only: [:update] do
    resources :expenses, only: [:index]
  end
  # charts
  get :categories, to: 'charts#categories', as: :chart_categories
  get :paid_by, to: 'charts#paid_by', as: :chart_paid_by
  get :paid_for, to: 'charts#paid_for', as: :chart_paid_for
  get :months, to: 'charts#months', as: :chart_months
  # data for stimulus load_modal_controller
  namespace :modal do
    resources :accounts, only: [:edit]
    resources :expenses, only: [:new, :edit, :show]
  end
  # data for stimulus loader_controller and others
  namespace :loader do
    get :dashboard, to: 'dashboard#show'
    resources :expenses, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
