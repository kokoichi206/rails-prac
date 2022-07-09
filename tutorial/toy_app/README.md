# README

## scaffold

``` sh
rails generate scaffold User name:string email:string
rails db:migrate

rails generate scaffold Micropost content:text user_id:integer
rails db:migrate
```

## memo

- `id` パラメータは Rails によって自動的に主キーとして DB に追加される〜
- 
