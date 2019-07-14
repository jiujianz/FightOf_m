Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :tasks
  resources :messages, only: [:index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
