# README

##users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name kana    | string | null: false |
| last_name kana     | string | null: false |
| birthday           | datetime| null: false |

###Association

has_many :items
has_many :comments

##items テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| items_name          | string | null: false |
| image               | string | null: false |
| explanation         | string | null: false |
| category            | text   | null: false |
| status              | string | null: false |
| delivery_fee        | string | null: false |
| shipping_area       | string | null: false |
| shipping_days       | datetime| null: false |
| price               | integer | null: false |

###Association

belongs_to :user
has_many :comments

##comments テーブル

| Column             | Type   | Option       |
|------------------- | ------ | -------------|
| comment            | text   | null: false  |

###Association

belongs_to :user
belongs_to :items
