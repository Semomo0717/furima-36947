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

| Column             | Type       | Options                         |
| ------------------ | -----------| --------------------------------|
| name               | string     | null: false                     |
| email              | string     | unique: true null: false        |
| encrypted_password | string     | null: false                     |
| first_name         | string     | null: false                     |
| second_name        | string     | null: false                     |
| first_kana_name     | string     | null: false                     |
| second_kana_name    | string     | null: false                     |
| bitrhday           | date       | null: false                     | 


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type      | Options                          |
| ----------------| ----------| ---------------------------------|
| title           | string    | null: false,                     |
| explanation     | text      | null: false,                     |
| category_id     | integer   | null: false,                     |
| situation_id    | integer   | null: false,                     |
| method_id       | integer   | null: false,                     |
| area_id         | integer   | null: false,                     |
| timeship_id     | integer   | null: false,                     |
| cost            | integer   |  null: false,                    |
| user            | references| null: false,  foreign_key: true  |

### Association

- belongs_to :user
- has_one :order



## orders テーブル

| Column          | Type      | Options                          |
| ----------------| ----------| ---------------------------------|
| user            | references| null: false,  foreign_key: true  |
| item            | references| null: false,  foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipment


## shipments テーブル

| Column          | Type      | Options                          |
| ----------------| ----------| ---------------------------------|
| post_code       | string    | null: false,                     |
| area_id         | integer   | null: false,                     |
| municipality    | string    | null: false                      |
| adress          | string    | null: false,                     |
| building        | string    |                                  |
| telephone_number| string    | null: false,                     |
| order           | references| null: false,  foreign_key: true  |


### Association

- belongs_to :order


