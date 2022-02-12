Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :customers
      resources :accounts
      resources :movements
      resources :charges
      resources :type_accounts
      resources :type_movements
    end
  end

  #ELIMINAR
  devise_for :users
  get 'home/index'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
