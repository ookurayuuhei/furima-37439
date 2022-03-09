# README

##users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

###Association

has_many :items
has_many :comments
has_many :purchases

##items テーブル

| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| items_name          | string    | null: false |
| explanation         | text      | null: false |
| category_id         | integer   | null: false |
| status_id           | integer   | null: false |
| delivery_fee_id     | integer   | null: false |
| shipping_area _id   | integer   | null: false |
| shipping_days_id    | integer   | null: false |     
| price               | integer   | null: false |
| user                |references | null: false, foreign_key: true |

###Association

belongs_to :user
has_many :comments
has_one :purchase

##comments テーブル

| Column             | Type   | Option       |
|------------------- | ------ | -------------|
| comment            | text   | null: false  |
| user                |references | null: false, foreign_key: true |
| item                |references | null: false, foreign_key: true |

###Association

belongs_to :user
belongs_to :items

##purchases テーブル

| Column             | Type        | Option       |
|------------------- | ------      | -------------|
| user               | references  | null: false, foreign_key: true   |
| item               | references  | null: false, foreign_key: true   |

###Association
belongs_to :user
belongs_to :item
has_one :address

##addresses テーブル

| Column             | Type    | Option       |
|------------------- | ------- | -------------|
| post_number        | string  | null: false  |
| shipping_are_id    | integer | null: false  |
| city               | string  | null: false  |
| address            | string  | null: false  |
| build              | string  |              |
| phone_number       | string  | null: false  |
| purchase           | references  | null: false, foreign_key: true   |

belongs_to :purchase