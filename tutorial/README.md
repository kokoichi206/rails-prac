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
- インスタンス変数
  - `@foo = 1`
- ERB: Embedded Ruby
- Rubyのメソッドには、"暗黙"の戻り値がある
  - メソッド内で最後に評価された式の値が自動的に返される
- シンボルというデータ形式
  - `:foo-bar`
  - ハッシュのキーとしても使われがち
  - 文字列としてみなしても一旦良い

### irb: Interactive RuBy

``` sh
# ~/.irbrc
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT_MODE] = false
```

パーシャル（partial）で使う普遍的な命名規約として、`_foobar.html.erb`

### Basics

``` sh
rails console

# 式展開（interpolation）
first_name = "John"
"#{first_name} Doe"

# 出力
# puts = put string => プットエス
puts "foo"
# print は改行が自動ではつかない
print "foo"

# この辺 Ruby っぽい気する？
"foobar".length
"".empty?
s.nil?
# nil もオブジェクト〜
nil.to_s
>> nil.to_s.empty?
=> true

# 後続 if
puts "x is not empty" if !x.empty?

# !! (bang bang) を使うと、どんなオブジェクトも強制的に論理値に変換できる
# オブジェクトそのものが false になるのは、false と nil のみ！
>> !!nil
=> false
>> !!0
=> true

puts "It's a palindrome!" if s == s.reverse


# 配列
"fooxbarxbaz".split('x')
# マイナスあるやん！
a.last == a[-1]

# メソッドによる効果を「破壊的」にしたければ、! をつける！
>> s = "hoge"
=> "hoge"
>> s.reverse
=> "egoh"
>> s
=> "hoge"
>> s.reverse!
=> "egoh"
>> s
=> "egoh"

# range
(0..9).to_a
("a".."z").to_a


# ブロック
(1..5).each { |i| puts 2 * i }
(1..5).each do |i|
  puts 2 * i
end
3.times { puts "Betelgeuse!" }
(1..5).map { |i| i**2 }
%w[a b c]                        # %w で文字列の配列を作成
%w[a b c].map { |char| char.upcase }

(0..16).each { |n| puts n ** 2 }
"pieeen".split("").shuffle.join()


# ハッシュ
user = {}

# シンボル、というデータ形式！
user = { :name => "Michael Hartl", :email => "michael@example.com" }
# 以下の二つは等価！特に下を文字列と間違えない！
{ :name => "Michael Hartl" }
{ name: "Michael Hartl" }

# inspect & p
puts (1..5).to_a.inspect
[1, 2, 3, 4, 5]
p (1..5).to_a
[1, 2, 3, 4, 5]
p :name  # = puts :name.inspect

# メソッド呼び出しの丸カッコは省略可能。
stylesheet_link_tag('application', media: 'all',
                                   'data-turbolinks-track': 'reload')
stylesheet_link_tag 'application', media: 'all',
                                   'data-turbolinks-track': 'reload'

# 最後の引数がハッシュの場合、波カッコは省略可能。
stylesheet_link_tag 'application', { media: 'all',
                                     'data-turbolinks-track': 'reload' }
stylesheet_link_tag 'application', media: 'all',
                                   'data-turbolinks-track': 'reload'

# Ruby はあらゆるものがオブジェクトである
s.class.superclass.superclass

class Word < String
  def palindrome?
    self == self.reverse
  end
end
w = Word.new("foobar")
w.palindrome?

# 多重代入 (Multiple Assignment) 
@user.password = @user.password_confirmation = "a" * 5
```

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

migration

``` sh
rails db:migrate
rails db:rollback
rails db:migrate VERSION=0
```

### 突然 rails コマンドが効かなくなった

``` sh
# spring が悪さしている可能性
# https://iwjp.net/blog/2018/10/18/rails_freeze/
bin/spring stop
```

### memo

- yieldメソッドはWebサイトのレイアウトにページごとの内容を挿入
- erb の生成する HTML の中の、画像ファイル等に対するランダムなsrcの文字列
  - 例えば画像ファイルを新しい画像に更新したときに、ブラウザ内に保存されたキャッシュに意図的にヒットさせないようにするための仕組み

### アセットパイプライン

静的コンテンツの生産性と管理を大幅に強化
本番環境での効率性向上

- アセットディレクトリ
- マニフェストファイル
  - 実際にアセットをまとめる処理を行うのはSprocketsというgem
- プリプロセッサエンジン
  - ファイルの拡張子を元に判断
  - foobar.js.erb.coffee
    - coffee -> erb -> js の順に適応される

### Sass
ネストと変数、とミックスイン。
SCSSというフォーマットに対応。

`bootstrap-sass`のgemで用意されている変数（[LESS変数一覧](https://getbootstrap.com/docs/3.4/customize/#less-variables)）

### routing
- 名前つきルート
  - 基本的には`_path`書式を使う
  - リダイレクトの場合のみ`_url`書式を使う

### Active Record
Migration と共に、データベースの細部をほぼ完全に隠蔽し、切り離すのに貢献。

ApplicationRecord を継承したモデルが何ができるのか。


```sh
rails console --sandbox

# new はメモリ上に作成
user = User.new(name: "Michael Hartl", email: "mhartl@example.com")
Validity: user.validate?
# save で実際に DB に保存
user.save
# create = new + save, but 生成と保存は分けた方が何かと良い
user = User.create(name: "Michael Hartl", email: "mhartl@example.com")

user.name.class

User.find(3)
User.find_by(email: "mhartl@example.com")

user.reload.email

# なるほど、マジックカラムである created_at も更新可能なのか〜
user.created_at = 1.year.ago
```

- Active Recordはデータベースのレベルでは一意性を保証していない
  - データベースレベルでも一意性を（別途）強制する必要がある
- セキュアなパスワードの実装は、`has_secure_password` というRailsのメソッドを呼び出すだけでほとんど終わってしまいます
  - `password_digest` という属性がモデル内に含まれていることが、使用の条件！

### Commands

``` sh
rails test
rails test:models
rails test:integration
```

### Environments

``` sh
rails console test
rails server --environment production
rails db:migrate RAILS_ENV=production
```

### yaml

``` sh
>> puts user.attributes.to_yaml
---
id: 1
name: El Duderino
email: mhartl@example.com
created_at: !ruby/object:ActiveSupport::TimeWithZone
  utc: &1 2022-07-10 07:41:13.521787000 Z
  zone: &2 !ruby/object:ActiveSupport::TimeZone
    name: Etc/UTC
  time: *1
updated_at: !ruby/object:ActiveSupport::TimeWithZone
  utc: &3 2022-07-10 07:45:41.137063000 Z
  zone: *2
  time: *3
password_digest: "$2a$10$ccgDIfU9MN1VOLb6O6h9LuD8/m8Bu2kL//jgVAVLs4HKu4szTaEsy"
=> nil
y user.attributes でも一緒
```

## Rails Command

|command|abbreviation|
|---|---|
|rails server|rails s|
|rails console|rails c|
|rails generate|rails g|
|rails test|rails t|
|bundle install|bundle|

## Memo

- REpresentational State Transfer
  - RESTの原則に従う場合、リソースへの参照はリソース名とユニークなIDを使うのが普通
- ポンド記号#
- コントローラ名には複数形を使い、モデル名には単数系を用いる！
- `created_at`と`updated_at`という２つの「マジックカラム (Magic Columns)」が追加される。。。
