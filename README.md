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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| name_kana| string | null: false |
| birth_day| string | null: false |

### Association

- has_many :items
- belongs_to :buy_items

## items テーブル

| Column         | Type   | Options                            |
| -------------- | ------ | -----------                        |
| items_images   | string | null: false                        |
| items_name     | string | null: false                        |
| items_explain  | string | null: false                        |
| items_category | string | null: false                        |
| items_status   | string | null: false                        |
| delivery_fee   | string | null: false                        |
| selling_price  | string | null: false                        |
| selling_fee    | string | null: false                        |
| selling_profit | string | null: false                        |
| user_id        | references | null: false, foreign_key: true |


### Association

- has_many :users

## buy_items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | string     | null: false                    |
| expiration_date | string     | null: false                    |
| security_code   | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one:delivery_address

## delivery_address テーブル

| Column  | Type       | Options                                     |
| ------- | ---------- | ------------------------------              |
| postal_code          | string     | null: false                    |
| prefectures          | string     | null: false                    |
| munisicipality       | string     | null: false                    |
| address              | string     | null: false                    |
| building_name        | string     | null: false                    |
| phone_number         | string     | null: false                    |
| user_id              | references | null: false, foreign_key: true |


### Association

- belongs_to :buy_items

