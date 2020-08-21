# README

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
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
| name                  | string  | null: false |
| description           | text  | null: false |
| categories            | integer | null: false |
| state                 | integer | null: false |
| burden_of_delivery_charges | integer | null: false |
| ship_to_region             | integer | null: false |
| day_to_ship                | integer | null: false |
| price                      | integer | null: false |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :Shipping Address

## Shipping Addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

### Association

- belongs_to :purchases

