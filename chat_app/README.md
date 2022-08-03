# README

I studied this app from [youtube](https://www.youtube.com/watch?v=UvTLumcEMgU&list=PL3mtAHT_eRex1sJI2uoTBgFT3qAXFbEcy&ab_channel=Deanin).
Thank you !

[Devise Auth Setup in Rails 7](https://betterprogramming.pub/devise-auth-setup-in-rails-7-44240aaed4be)

```sh
# ----- Chap 1 -----
rails g devise User
rails db:migrate

rails g controller pages home
rails s

rails g model Room name:string is_private:boolean
rails g controller rooms index

rails turbo:install
rails turbo:install:redis

# message
rails g model Message user:references room:references body:text
rails db:migrate

rails g controller messages

# ----- Chap 2 -----
rails g controller users show

rails g model Participant user:references room:references
rails db:migrate

# ----- Chap 4 -----
rails active_storage:install
rails db:migrate

ails g devise:controllers users

rails g devise:views

## change Gemfile
brew install image_processing
brew install vips
bundle install

rails c
-> User.find_each(&:save)

# ----- Chap 5 -----
rails g migration add_status_to_users status:integer

rails g channel appearance
```

## Redis

```sh
brew install redis
redis-server --daemonize yes
redis-server --daemonize yes
```

## Links

-   [bootstrap cdn](https://getbootstrap.jp/docs/5.0/getting-started/introduction/)
-   [bootstrap navbar](https://getbootstrap.jp/docs/5.0/components/navbar/)
