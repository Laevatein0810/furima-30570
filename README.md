# テーブル設計

## usersテーブル
| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| nickname                | string | null: false |
| last name               | string | null: false |
| first name              | string | null: false |
| frigana last            | string | null: false |
| frigana first           | string | null: false |
| birthday                | string | null: false |
| email                   | string | null: false |
| encrypted_password      | string | null: false |

### Association

- has_many :items
- has_many :buyers

## itemsテーブル
| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| name            | string      | null: false                    |
| description     | string      | null: false                    |
| delivery charge | string      | null: false                    |
| delivery source | string      | null: false                    |
| shipping days   | string      | null: false                    |
| category_id     | integer     | null: false                    |
| price           | integer     | null: false                    |
| user            | references  | null: false, foreign_key: true |
 
### Association
- has_many :users
- has_many :buyers

## commentsテーブル
| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references |             |
| text   | text       | null: false |

### Association
- belongs_to :users
- belongs_to :items

## buyersテーブル
| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| name    | references | null: false, foreign_key: true|
| user_id | string     | null: false                   |
| item_id | string     | null: false                   |

### Association

- has_one :delivery
- has_many :items

## deliveryテーブル
| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| postal code    | string | null: false |
| prefectures    | string | null: false |
| cities         | string | null: false |
| address        | string | null: false |
| phone number   | string | null: false |

### Association

- has_one :buyers
