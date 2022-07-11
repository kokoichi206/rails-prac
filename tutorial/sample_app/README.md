# README

``` sh
rails _5.1.6_ new sample_app

rails generate controller StaticPages home help

# new アクションを追加
rails generate controller Users new

rails generate model User name:string email:string
rails db:migrate
rails db:rollback

# email に index を追加する
rails generate migration add_index_to_users_email

rails generate migration add_password_digest_to_users password_digest:string

# テストも rails コマンドで作れる
rails generate integration_test users_signup
```

create user by hand

```sh
# into console
rails console

# create a uesr
User.create(name: "Michael Hartl", email: "mhartl@example.com", password: "foobar", password_confirmation: "foobar")

user = User.find_by(email: "mhartl@example.com")
user.authenticate("wrong_password")
user.authenticate("foobar")

# 認証にはばんばんを使う
>> !!user.authenticate("foobar")
=> true
>> !!user.authenticate("wrong_password")
=> false

# うまくいかない
user.name = "hogee"
user.save
# 
user.update_attribute(:name, "El Duderino")


Digest::MD5::hexdigest(email.downcase)
```

```
/signup?admin=1
```

## test

### 目的

* テストが揃っていれば、機能停止に陥るような回帰バグを防止できる
* テストが揃っていれば、コードを安全にリファクタリングできる
* テストコードは、アプリケーションコードから見るとクライアントとして動作するので、アプリケーションの設計やシステムの他の部分とのインターフェイスを決めるときにも役立つ

### テスト駆動にするかの判断

* アプリケーションのコードよりも明らかにテストコードの方が短くシンプルになる (=簡単に書ける) のであれば、「先に」書く
* 動作の仕様がまだ固まりきっていない場合、アプリケーションのコードを先に書き、期待する動作を「後で」書く
* セキュリティが重要な課題またはセキュリティ周りのエラーが発生した場合、テストを「先に」書く
* バグを見つけたら、そのバグを再現するテストを「先に」書き、回帰バグを防ぐ体制を整えてから修正に取りかかる
* すぐにまた変更しそうなコード (HTML構造の細部など) に対するテストは「後で」書く
* リファクタリングするときは「先に」テストを書く。特に、エラーを起こしそうなコードや止まってしまいそうなコードを集中的にテストする

モデルのバリデーション機能は、テスト駆動開発とまさにピッタシの機能と言えます

## Links
- [Sample Code (GitBucket)](https://bitbucket.org/railstutorial/sample_app_4th_ed/src/master/)
