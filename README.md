## アプリケーション名

  artwork-donation

## アプリケーションの概要

  芸術作品の出品・購入を通じて資金を募り、国境を超えた援助・協力活動を行うアプリです。  



  支援プロジェクトへの協力を希望するユーザーは、別途アーティスト登録を行います。  
  その際の登録情報として、現在まだ達成されていないプロジェクトの中から1つ、自分が支援したいプロジェクトを選択します。  
  アーティストは自身で作成した芸術作品やハンドメイドなどに値段をつけて販売することができ、その売り上げ金の90%が、登録の際に自身が指定した支援プロジェクトへと寄付される仕組みとなっています。  

  プロジェクトへの支援金総額が登録時に設定された目標金額に達した場合、そのプロジェクトは達成となります。  

  新しいプロジェクトの登録は、管理者権限を持つユーザーのみが行うことができます。
  また、新しいプロジェクトが1つ登録されるにあたって、そのプロジェクトに対応するチャットルームも同時に1つ作成されます。  
  アーティストは自身と同じプロジェクトを選択している他のアーティストと、チャットルームでメッセージのやりとりを通じて交流を持つことができます。  
  作品が購入された場合、誰の作品が購入され、いくら寄付されたのかの情報が、チャットルームに購入ログとして表示されます。  
  
  ユーザーは検索機能を用いて、フィーリングやメインカラーなどの詳細な情報から、自分の好みの作品を探すことができます。  
  気になる作品があれば、お気に入り登録することで、マイページから後でまとめて確認できます。  
  クレジットカード情報を登録することで、好きな作品を購入することができます。  

## URL

  https://artwork-donation.herokuapp.com/

## テスト用アカウント

  - BASIC認証    
    ユーザー名: admin  
    パスワード: 2222  
  - クレジットカード情報  
    カード番号：4242424242424242  
    カード期限：Mon Mar 23 2020 00:00:00 GMT+0900 (日本標準時)  
    カードセキュリティコード：123  
  - 管理者権限ありユーザー  
    email: admin@example.jp , password: 111bbb  
  - 管理者権限なしユーザー  
    email: abc@xyz          , password: 111ccc  

## 洗い出した要件	

  - 作品検索  
    様々な特徴から作品を検索できるようにする。  
  - アーティスト検索  
    名前からアーティストを検索できるようにする。  
  - ユーザーログイン  
    登録した情報でログインする。  
  - ユーザー登録  
    サイトを使用するための基本情報を登録する。  
  - アーティスト登録  
    支援プロジェクトへ参加し、自分の作品を登録可能にする。  
  - 作品登録  
    ユーザーが購入できる作品を登録する。  
  - 支援プロジェクト登録  
    管理者が新しく支援プロジェクトを登録できるようにする。  
  - コメント投稿  
    各作品に対してのコメントを可能にする。  
  - ルームメッセージ投稿  
    アーティスト間でコミュニティーを持てるようにする。  
  - 購入・寄付  
    購入された際の売上金が支援プロジェクトへ寄付されるようにする。  
  - お気に入り登録  
    自分の気になる作品を後で参照しやすくする。  
  - カード情報登録  
    登録することで作品購入を可能にする。  
  - 購入ログ保存  
    購入情報を個別で保存し、ログとして残す。  

## E-R図

  https://gyazo.com/d440a8a30d568fc8f07ed36e08600f41
  https://gyazo.com/51d8a274bd0da63f89fd5f1837f8c854

# テーブル設計

## users テーブル

| Column                | Type      | Options                     |
| --------------------- | --------- | --------------------------- |
| nickname              | string    | null: false, unique: true   |
| password              | string    | null: false                 |
| email                 | string    | null: false                 |
| last_name             | string    | null: false                 |
| first_name            | string    | null: false                 |
| last_name_kana        | string    | null: false                 |
| first_name_kana       | string    | null: false                 |
| birth_date            | date      | null: false                 |
| admin                 | boolean   | null: false, default: false |

### Association

- has_one :artist
- has_one :card
- has_many :comments
- has_many :orders
- has_many :favorites
- has_many :artworks, through: :favorites

## artists テーブル

| Column                        | Type       | Options                        |
| ----------------------------- | ---------- | ------------------------------ |
| artist_name                   | string     | null: false, unique: true      |
| affiliation                   | string     |                                |
| personal_history              | text       |                                |
| reason_for_support_activities | text       |                                |
| artist_message                | text       |                                |
| user                          | references | null: false, foreign_key: true |
| donation_project              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :donation_project
- has_many :artworks
- has_many :room_messages

## artworks テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| title                 | string     | null: false                    |
| text                  | text       | null: false                    |
| size                  | string     | null: false                    |
| price                 | integer    | null: false                    |
| category_id           | integer    | null: false                    |
| main_color_id         | integer    | null: false                    |
| motif_id              | integer    | null: false                    |
| feeling_id            | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| scheduled_delivery_id | integer    | null: false                    | 
| artist                | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :artist
- has_many :comments
- has_many :favorites
- has_many :users, through: :favorites

## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| artwork       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :artwork

## orders テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| donation_project       | references | null: false, foreign_key: true |
| user                   | references | null: false, foreign_key: true |
| artwork                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :artwork
- belongs_to :donation_project
- has_one :delivery_address

## delivery_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## cards テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_token       | string     | null: false                    |
| customer_token   | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## donation_projects テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| project_name     | string     | null: false                    |
| text             | text       | null: false                    |
| target_amount    | integer    | null: false                    |
| current_amount   | integer    | null: false, default: 0        |

### Association

- has_many :artists
- has_many :orders
- has_one :donation_project_room

## favorites テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| artwork        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :artwork

## donation_project_rooms テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| donation_project | references | null: false, foreign_key: true |

### Association

- belongs_to :donation_project
- has_many :room_messages
- has_many :sale_logs

## room_messages テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| text                  | string     | null: false                    |
| artist                | references | null: false, foreign_key: true |
| donation_project_room | references | null: false, foreign_key: true |

### Association

- belongs_to :artist
- belongs_to :donation_project_room

## sale_logs テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| artist_name           | string     |                                |
| artwork_title         | string     |                                |
| donation_price        | integer    |                                |
| donation_project_room | references | null: false, foreign_key: true |

### Association

- belongs_to :donation_project_room


