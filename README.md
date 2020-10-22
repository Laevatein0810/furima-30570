# テーブル設計

## usersテーブル
| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| nickname                | string | null: false |
| last_name               | string | null: false |
| first_name              | string | null: false |
| frigana_last            | string | null: false |
| frigana_first           | string | null: false |
| birthday                | date   | null: false |
| email                   | string | null: false |
| encrypted_password      | string | null: false |

### Association

- has_many :items
- has_many :buyers

## itemsテーブル
| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| name               | string       | null: false                    |
| description        | text         | null: false                    |
| status_id          | integer      | null: false                    |
| delivery_charge_id | integer      | null: false                    |
| prefectures_id     | integer      | null: false                    |
| shipping_days_id   | integer      | null: false                    |
| category_id        | integer      | null: false                    |
| price              | integer      | null: false                    |
| user               | references   | null: false, foreign_key: true |
 
### Association
- belongs_to :user
- has_one :buyer

## commentsテーブル
| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references |             |
| text   | text       | null: false |

### Association
- belongs_to :user
- belongs_to :item

## buyersテーブル
| Column  | Type    | Options                       |
| ------- | ------- | ----------------------------- |
| user_id | integer | null: false, foreign_key: true|
| item_id | integer | null: false, foreign_key: true|

### Association

- has_one :delivery
- belongs_to :item
- belongs_to :user

## deliveryテーブル
| Column         | Type         | Options                        |
| -------------- | ------------ | ------------------------------ |
| postal_code    | string       | null: false                    |
| prefectures_id | integer      | null: false                    |
| cities         | string       | null: false                    |
| address        | string       | null: false                    |
| building       | string       |                                |
| phone_number   | string       | null: false                    |
| buyer          | references   | null: false, foreign_key: true |

### Association

- belongs_to :buyer
