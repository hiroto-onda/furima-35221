# README
# DB 設計

This README would normally document whatever steps are necessary to get the
application up and running.
## users table

Things you may want to cover:
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
| nick_name          | string              | null: false             |
| birthdayt          | string              | null: false             |

* Ruby version

* System dependencies
### Association

* Configuration
* has_many :items

* Database creation
## items table

* Database initialization
| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| product                             | string     | null: false       |
| category                            | string     | null: false       |
| price                               | string     | null: false       |
| user                                | references | foreign_key: true |

* How to run the test suite
### Association

* Services (job queues, cache servers, search engines, etc.)
- belongs_to :users

* Deployment instructions
-----------------------------------------------------------------------------------

* ...

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
=======