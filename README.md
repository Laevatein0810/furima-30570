# テーブル設計

## usersテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :buyers

## itemsテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| image     | string     | null: false                    |
| category  | string     | null: false                    |
| price     | string     | null: false                    |
| user      | references | null: false, foreign_key: true |

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
| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| name   | references | null: false, foreign_key: true|

### Association

- has_one :delivery
- has_many :items

## deliveryテーブル
| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| street address | string | null: false |

### Association

- has_one :buyers
