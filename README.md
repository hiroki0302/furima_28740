# README

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| last_name_kana        | string | null: false |
| birthday              | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                     | Type    | Options     |
| -------------------------- | ------- | ----------- |
| item name                  | string  | null: false |
| item description           | string  | null: false |
| item categories            | integer | null: false |
| item state                 | integer | null: false |
| burden of delivery charges | integer | null: false |
| ship to region             | integer | null: false |
| day to ship                | integer | null: false |
| price                      | integer | null: false |

### Association

- has_one :purchases
- belongs_to :users

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## Shipping Address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post code     | integer    | null: false                    |
| prefecture_id | string     | null: false                    |
| city          | string     | null: false                    |
| block         | integer    | null: false                    |
| building      | string     |                                |
| phone_number  | integer    | null: false                    |

### Association

- belongs_to :room
- belongs_to :user

