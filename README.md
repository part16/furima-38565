# README

##　usersテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| nickname             | string     | null: false                    |
| email                | string     | null: false,  unique: true     |
| encrypted_password   | string     | null: false                   |
| name_sei             | string     | null: false                    |
| name_mei             | string     | null: false                    |
| name_furi            | string     | null: false                    |
| name_gana            | string     | null: false                    |
| birth_date           | date       | null: false


### Association

has_many :histories
has_many :items



##　itemsテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| user                 | references | null: false,  foreign_key: true|
| item_name            | string     | null: false                    |
| item_discribe        | text       | null: false                    |
| state_id             | integer    | null: false                    |
| category_id          | integer    | null: false                    |
| postage_id           | integer    | null: false                    |
| ship_id              | integer    | null: false                    |
| scheduled_day_id     | integer    | null: false                    |
| item_price           | integer    | null: false                    |


### Association

belongs_to :user
has_one   :history



##　areasテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| history              | references | null: false, foreign_key: true |
| post_code            | string     | null: false                    |
| ship_id              | integer    | null: false                    |
| city                 | string     | null: false                    |
| address              | string     | null: false                    |
| building             | string     |                                |
| phone_number         | string     | null: false                    |

### Association
belongs_to :history



##　historiesテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |

### Association
belongs_to :item
has_one   :area
belongs_to :user