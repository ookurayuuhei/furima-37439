# README

##users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name kana    | string | null: false |
| last_name kana     | string | null: false |
| birthday           | date   | null: false |

###Association

has_many :items
has_many :comments
has_many :purchases

##items テーブル

| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| items_name          | string    | null: false |
| explanation         | string    | null: false |
| category_id         | integer   | null: false |
| status_id           | integer   | null: false |
| delivery_fee_id     | integer   | null: false |
| shipping_area _id   | integer   | null: false |
| shipping_days_id    | integer   | null: false |     
| price               | integer   | null: false |

###Association

belongs_to :user
has_many :comments
has_one :purchase

##comments テーブル

| Column             | Type   | Option       |
|------------------- | ------ | -------------|
| comment            | text   | null: false  |

###Association

belongs_to :user
belongs_to :items

##purchase テーブル

| Column             | Type   | Option       |
|------------------- | ------ | -------------|
|                    |        |              |

###Association
belongs_to :user
belongs_to :item

##adress テーブル

| Column             | Type   | Option       |
|------------------- | ------ | -------------|
| post_number        | string | null: false  |
| prefectures        | string | null: false  |
| city               | string | null: false  |
| address            | string | null: false  |
| build              | string |              |
| phone_number       | string | null: false  |

