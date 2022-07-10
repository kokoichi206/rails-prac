Rails.application.routes.draw do
  get 'users/new'

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
