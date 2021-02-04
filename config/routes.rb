Rails.application.routes.draw do
  #get 'product/index'
  #get 'product/show', as: 'product_path'
  #get 'product/new'
  #get 'product/edit'
  resources :product
  devise_for :users
  get 'persons/profile'
  get 'index', to: 'index#index'
  root 'index#index'
  get 'persons/profile', as: 'user_root'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
