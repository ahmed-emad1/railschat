Rails.application.routes.draw do
  devise_for :users
  get 'homepage/index'

  resources :messages , only: [:new,:create]
  root 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
