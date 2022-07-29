# README

[Template from this site](https://railsbytes.com/)

```sh
# https://railsbytes.com/public/templates/z0gsLX
rails new tested_app -t


echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshenv
echo 'eval "$(rbenv init -)"' >> ~/.zshenv
echo 'source $HOME/.zshenv' >> ~/.zshrc
exec $Shell

bundle install
rails g devise:install
rails g devise User

rails db:migrate RAILS_ENV=test

rails generate rspec:install
rails spec
```
