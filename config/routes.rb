Rails.application.routes.draw do
  resources :product
  devise_for :users
  get 'persons/profile'
  get 'index', to: 'index#index'
  root 'index#index'
  get 'persons/profile', as: 'user_root'
  post 'request/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
