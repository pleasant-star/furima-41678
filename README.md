# テーブル設定

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| password           | string | null: false |
| name1              | string | null: false |
| name2              | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases
- has_many :comments

## itemsテーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| item-name   | string     | null: false |
| explanation | text       | null: false |
| category    | string     | null: false |
| status      | string     | null: false |
| postage     | string     | null: false |
| area        | string     | null: false |
| send-day    | string     | null: false |
| price       | integer    | null: false |
| user        | references | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## purchasesテーブル
| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| buyer  | string     | null: false |
| user   | references | null: false |
| item   | references | null: false |

### Association

- be_longs :user
- be_longs :item
- has-one :address

## addressesテーブル
| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| zip-code      | integer | null: false |
| address1      | string  | null: false |
| address2      | string  | null: false |
| address3      | string  | null: false |
| building-name | string  | null: false |
| tell          | integer | null: false |

### Association

- belongs :purchase

## commentsテーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| content | text       | null: false |
| item    | references | null: false |
| user    | references | null: false |

### Association

- belong_to :user
- belong_to :item