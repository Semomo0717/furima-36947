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
| email              | string | null: false   |
| password           | string | null: false   |
| encrypted_password | string | null: false   |
| real_name          | string | null: false   |
| full_name          | string | null: false   |
| bitrhday           | date   | null: false   | 


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type   | Options                          |
| ----------------| ------ | ---------------------------------|
| title           | string | null: false,                     |
| explanation     | text   | null: false,                     |
| category_id     | text   | null: false,                     |
| situation_id    | text   | null: false,                     |
| method_id       | text   | null: false,                     |
| area_id         | text   | null: false,                     |
| timeship_id     | tinynt | null: false,                     |
| cost            | tinynt | null: false,                     |
| user            | text   | null: false,  foreign_key: true  |

### Association

- belongs_to :user
- has_one :order



## orders テーブル

| Column          | Type   | Options                          |
| ----------------| ------ | ---------------------------------|
| user            | text   | null: false,  foreign_key: true  |
| item            | text   | null: false,  foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipment


## shipments テーブル

| Column          | Type   | Options                          |
| ----------------| ------ | ---------------------------------|
| post_code       | string | null: false,                     |
| area_id         | text   | null: false,   foreign_key: true |
| municipality    | string | null: false                      |
| adress          | string | null: false,                     |
| building        | string |                                  |
| telephone_number| string | null: false,                     |
| item            | text   | null: false,   foreign_key: true |


### Association

- belongs_to :orders
- belongs_to :item


