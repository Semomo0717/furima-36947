# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users テーブル

| Column             | Type   | Options       |
| ------------------ | ------ | -----------   |
| name               | string | null: false   |
| email              | string | unique: false |
| encrypted_password | string | null: false   |
| real_name          | text   | null: false   |
| full_name          | text   | null: false   |
| bitrhday           | text   | null: false   | 


### Association

- has_many :item
- has_many :orders

## item テーブル

| Column          | Type   | Options                          |
| ----------------| ------ | ---------------------------------|
| title           | text   | null: false,                     |
| explanation     | text   | null: false,                     |
| category        | text   | null: false,                     |
| situation       | text   | null: false,                     |
| shipping_method | text   | null: false,                     |
| shipping_area   | text   | null: false,                     |
| time_ship       | text   | null: false,                     |
| cost            | text   | null: false,                     |
| user_id         | text   | null: false,  foreign_key: true  |

### Association

- belongs_to :user
- has_one :shipment
- has_one :orders



## orders テーブル

| Column          | Type   | Options                          |
| ----------------| ------ | ---------------------------------|
| user_id         | text   | null: false,  foreign_key: true  |
| item_id         | text   | null: false,  foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item


## shipment テーブル

| Column          | Type   | Options                          |
| ----------------| ------ | ---------------------------------|
| post_code       | text   | null: false,                     |
| prefectures     | text   | null: false,                     |
| municipality    | text   | null: false                      |
| adress          | text   | null: false,                     |
| building        | text   | null: false,                     |
| telephone_number| text   | null: false,                     |
| item_id         | text   | null: false,   foreign_key: true |


### Association

- belongs_to :item
- has_one    :orders

