## Links

- [Set up Cloud9](https://railstutorial.jp/chapters/beginning?version=6.0#sec-installing_rails)

## Commands

``` sh
bundle install --without production
```

## Ruby

- `:users` という記法は、Ruby 言語特有の「シンボル」と呼ばれるもの
- 継承は `<` 記号で表す
- ActiveRecord::Base
  - 作成したオブジェクトはデータベースにアクセスできるようになる
  - データベースのカラムをあたかも Ruby の属性のように扱える

## Rails

``` sh
# into Rails console
rails console

# in Rails console
first_user = User.first
first_user.microposts
first_user.microposts.first
first_user.user
```

## Memo

- REpresentational State Transfer
