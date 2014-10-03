node-qiita
==========

[![NPM version](https://badge.fury.io/js/qiita.svg)](http://badge.fury.io/js/qiita)

[Qiita API](http://qiita.com/api/v2/docs) の nodejs wrapper

インストール
============

`npm install --save qiita`

Tokenの取得方法
==============

## 個人用のアクセストークン

1. 右上のアイコンをクリックし、出てきたメニューから [設定] を選択。
2. [共通] の項目からアプリケーションを選択。
3. [個人用のアクセストークン] のところの [新しいトークンを発行する] をクリックする。
4. 必要な [スコープ] を選択し[発行する] をクリックする。

※発行した個人用アクセストークンは一度しか表示されない。

使い方
======

```coffee
Qiita = require "qiita"
# インスタンス化
q = new Qiita token: "xxxxxxxxx" # tokenはオプショナル

# インスタンス化 (qiita teamの場合)
q = new Qiita team: "team_id", token: "xxxxxxxxx"

# 投稿の作成
q.items.post
  title: "吾輩は猫である"
  body: "吾輩は猫である。名前はまだ無い。どこで生れたかとんと見当けんとうが....."
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
