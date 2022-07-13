Rails.application.routes.draw do
  # static_pages/homeへのアクセス
  # StaticPagesコントローラ内のhomeアクションが返る
  root 'static_pages#home'

  # これだけで名前付きルートが使えるようになる！（？）
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  # 変更することもできる
  # get  '/help',    to: 'static_pages#help', as: 'helf'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # /users/1 のような URL を有効にする
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
