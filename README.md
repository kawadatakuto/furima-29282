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

| Column          | Type     | Options     |
| --------------- | ------   | ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
| family_name     | string   | null: false |
| first_name      | string   | null: false |
| family_name_kana| string   | null: false |
| first_name_kana | string   | null: false |
| birth_day       | date     | null: false |

### Association

- has_many :items
- has_many :buy_items

## items テーブル

| Column         | Type       | Options                            |
| -------------- | ---------- | ---------------------------------- |
| name           | string     | null: false                        |
| explain        | text       | null: false                        |
| category       | integer    | null: false                        |
| status         | integer    | null: false                        |
| delivery_fee   | integer    | null: false                        |
| delivery_area  | integer    | null: false                        |
| delivery_times | integer    | null: false                        |
| selling_price  | integer    | null: false                        |
| user           | references | null: false, foreign_key: true     |


### Association

- belongs_to :user
- has_one :buy_item

## buy_items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| items           | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one:delivery_address

## delivery_address テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- |------------------------------- |
| postal_code          | integer    | null: false                    |
| prefectures          | integer    | null: false                    |
| munisicipality       | string     | null: false                    |
| address              | string     | null: false                    |
| building_name        | string     | null: true                    |
| phone_number         | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |


### Association

- belongs_to :buy_item

