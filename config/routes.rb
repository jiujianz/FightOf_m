Rails.application.routes.draw do
  root 'home#index'
  get 'signup',  to: 'users#new'
  post 'signup',  to: 'users#create'
  get    'login',   to: 'sessions#new'
  post   'login',   to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
  resources :users 
  resources :tasks do
    member do
      patch :complete
    end
  end
  resources :messages, only: [:index, :create]
  resources :maps, only: [:index]
  resources :movies, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
