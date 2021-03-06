Rails.application.routes.draw do
  resources :product
  devise_for :users
  get 'index', to: 'index#index'
  root 'index#index'
  get 'persons/profile', as: 'user_root'
  post 'request/create'
  post 'request/finish'
  post 'request/cancel'
  get 'request/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
