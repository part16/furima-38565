# README

##　usersテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| nickname             | string     | null: false,                   |
| email                | string     | null: false,                   |
| password             | string     | null: false                    |
| name_kan             | string     | null: false                    |
| name_kata            | string     | null: false                    |
| birth_date           | string     | null: false


### Association

has_many :history
has_many :items


##　itemsテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item_name            | text       | null: false,                   |
| item_discribe        | text       | null: false                    |
| item_state           | string     | null: false                    |
| item_price           | string     | null: false                    |


### Association

belong_to :user
has_one   :history


##　sendsテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| post_code            | string     | null: false,                   |
| prefecture           | string     | null: false                    |
| city                 | string     | null: false                    |
| address              | string     | null: false                    |
| building             | string     | null: false                    |
| phone_number         | string     | null: false                    |

### Association
belong_to :history


##　historiesテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| postage              | string     | null: false                    |
| sender               | string     | null: false                    |
| day                  | string     | null: false                    |

### Association
has_one :send