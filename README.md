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

## ＜このアプリの使用方法＞
  - まず５人分のユーザーを新規登録を行う。（これが管理者ユーザーと認識される）
  - 管理者ユーザーでログインした後に、関係者専用ページに遷移するので＜受付表をリセット＞ボタンを押すとダミーの予約データ生成され（管理者ユーザーが予約している状態になる）、受付が可能な状態になる。
    実際の挙動→https://gyazo.com/a809a9da02c625778b459e21151fa867
  - ６人目のユーザーを新規登録し、そのユーザーでログインすると受付予約画面に遷移出来る。
    実際の挙動→https://gyazo.com/bf4f3d48528ab4d81f21961d9dd7d948
  - 関係者ページから、ダミー予約データを削除すると上位５名に来院を促すメールが送信される。
    実際の挙動→https://gyazo.com/f5fd718b8e7a44f8701c6e8abf4bfd97
    実際にメールアドレスが存在する場合は以下のようなメールが届く
    <img width="830" alt="スクリーンショット 2020-09-07 7 39 24" src="https://user-images.githubusercontent.com/65641396/92336690-43da3000-f0de-11ea-8385-7b18d66e299c.png">
## <ポートフォリオのスライド>
  https://docs.google.com/presentation/d/1urB4gozZS4Wx62tmr-SCcJnlyAMEab89Xk6JVPpqb1E/edit#slide=id.g89c6cdf86c_0_448

## ＜開発環境＞
  - Mac OS Catalina
  - Ruby 2.5.1
  - Rails 5.2.4.3
  - Database:mysql

## ＜ダウンロード方法＞
 ### ソースコード
  - https://github.com/pixar2390/online-reservation.git
 ### デプロイ先のリンク
  - https://mighty-ocean-33222.herokuapp.com/users/sign_in

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




