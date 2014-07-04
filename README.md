node-qiita
==========

[Qiita API](https://qiita.com/docs) の nodejs wrapper


インストール
============

`npm install qiita`でインストール


使い方
======

```coffee
Qiita = require "qiita"
# インスタンス化
q = new Qiita token: "xxxxxxxxx" # tokenはオプショナル

# id, passwordからトークン取得
q.auth.post url_name: "myname", password: "abcdedg", (err, res, data) ->
  console.log data.token

# タグ一覧の取得
q.tags.get (err, res, tags) -> console.log tags

# 特定ユーザの投稿一覧の取得 (ネストしたリソース)
q.users.items.get url_name: "sakatam", (err, res, items) -> console.log items
```


これからやる
============

* pagination への対応
