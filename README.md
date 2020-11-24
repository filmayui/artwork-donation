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

# orders テーブル

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

- belongs_to :artist
- belongs_to :donation_project_room

## sale_logs テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| artist_name           | string     |                                |
| artwork_title         | string     |                                |
| donation_price        | integer    |                                |
| donation_project_room | references | null: false, foreign_key: true |

- belongs_to :donation_project_room


# アプリケーションの概要

## アプリケーション名

  artwork-donation

## URL



## テスト用アカウント
## 利用方法
## 目指した課題解決
## 洗い出した要件	
## 実装した機能についてのGIFと説明	
## 実装予定の機能	
## データベース設計	
## ローカルでの動作方法