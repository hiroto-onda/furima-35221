# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
| nick_name          | string              | null: false             |
| birthdayt          | string              | null: false             |


### Association

* has_many :items

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| product                             | string     | null: false       |
| category                            | string     | null: false       |
| price                               | string     | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :users

-----------------------------------------------------------------------------------


## purchase table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| card_information  | text       | null: false       |
| expiration_date   | text       | null: false       |
| security_code     | text       | null: false       |

### Association

- has_one :delivery_address

## delivery_address table

| Column        | Type       | Options           |
|---------------|------------|-------------------|
| city          | text       | null: false       |
| block         | text       | null: false       |
| building_name | text       | null: false       |
| phone_number  | text       | null: false       |

### Association

- belongs_to :purchase