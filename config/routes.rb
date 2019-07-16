Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'home#index'
  resources :tasks
  resources :messages, only: [:index, :create]
  resources :maps, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
