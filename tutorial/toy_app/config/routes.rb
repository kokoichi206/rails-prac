Rails.application.routes.draw do
  resources :users
  root 'users#index'
  
  get 'hello', to: 'application#hello'
end
