Rails.application.routes.draw do
  root 'homes#show'
  resource :homes, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
