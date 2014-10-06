node-qiita
==========

[Qiita API](http://qiita.com/api/v2/docs) の nodejs wrapper


インストール
============

`npm install --save qiita`


使い方
======

```coffee
Qiita = require "qiita"
# インスタンス化
q = new Qiita token: "xxxxxxxxx" # tokenはオプショナル

# インスタンス化 (qiita teamの場合)
q = new Qiita team: "team_id", token: "xxxxxxxxx"

# id, passwordからトークン取得
q.auth.post url_name: "myname", password: "abcdedg", (err, res, data) ->
  console.log data.token

# 投稿の作成
q.items.post
  title: "吾輩は猫である"
  body: "吾輩は猫である。名前はまだ無い。どこで生れたかとんと見当が....."
  tags: [{name: "小説"}]
, (err, res, body) ->
  # リクエスト結果の検証
  throw err if err?
  console.log "successfully posted to Qiita."

# タグ一覧の取得
q.tags.get (err, res, tags) -> console.log tags

# 特定ユーザの投稿一覧の取得 (ネストしたリソース)
q.users.items.get url_name: "sakatam", (err, res, items) -> console.log items
```


これからやる
============

* pagination への対応
