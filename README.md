# README
# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| email              | string              | null: false unique: true |
| encrypted_password | string              | null: false              |
| nick_name          | string              | null: false              |
| date               | date                | null: false              |
| family_name        | string              | null: false              |
| first_name         | string              | null: false              |
| family_name_kana   | string              | null: false              |
| first_name_kana    | string              | null: false              |

### Association

* has_many :items
* has_many :purchase

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| product                             | string     | null: false       |
| product_description                 | text       | null: false       |
| category                            | string     | null: false       |
| product_state_id                    | integer    | null: false       |
| delivery_charge_burden_id           | integer    | null: false       |
| regional_original_delivery_id       | integer    | null: false       |
| days_up_to_delivery                 | string     | null: false       |
| price                               | integer    | null: false       |
| user                                | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase

## purchase table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| users_id          | references | foreign_key: true |
| item_id           | references | foreign_key: true |

### Association

- has_one :delivery_address
- belongs_to :item
- belongs_to :user

## delivery_address table

| Column        | Type       | Options           |
|---------------|------------|-------------------|
| postal_code   | string     | null: false       |
| prefectures   | string     | null: false       |
| city          | text       | null: false       |
| block         | text       | null: false       |
| building_name | text       | null: false       |
| phone_number  | text       | null: false       |

### Association

- belongs_to :purchase
=======