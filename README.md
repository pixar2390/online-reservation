# Online-reservation

## ＜このアプリは何？＞
  - 病院の受付を想定し、それをネットで行うための予約サービス

## ＜このアプリができる事＞
  - 受付を済ませると、診察番号を取得できる。
  - 診察番号が近い患者に自動的にメールが送信され、来院を促す。

## ＜何故このアプリを作成するのか＞
  - 病院の待ち時間が長すぎで人が密集している状態を解消したいから（コロナ対策）
  - 待ち時間が長いと受付したのに突然出ていく人がいて、患者を管理できず病院関係者が困る
  - 病院で待っている患者さんが辛そうな顔をしている

## ＜開発環境＞
  - Mac OS Catalina
  - Ruby 2.5.1
  - Rails 5.2.4.3
  - Database:mysql

## ＜ダウンロード方法＞
  - https://github.com/pixar2390/online-reservation.git

  - 後でデプロイ場所のURLをここに書く

# online-reservation DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_one :reservation

## reservationsテーブル
|Column|Type|Options|
|------|----|-------|
|examination|integer|null: false|
|user|reference|null: false, foreign_key: true|
### Association
- belongs_to :user




