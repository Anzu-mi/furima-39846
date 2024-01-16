# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| confirm_password   | string | null: false               |
| name               | string | null: false               |
| kana               | string | null: false               |
| birthday           | string | null: false               |


## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_comment       | text       | null: false                    |
| category           | string     | null: false                    |
| item_situation     | string     | null: false                    |
| burden             | string     | null: false                    |
| ship_from          | string     | null: false                    |
| days               | string     | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |


## purchasesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


## shippingsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefectures        | string     | null: false                    |
| municipalities     | string     | null: false                    |
| street_address     | string     | null: false                    |
| building_name      | string     |                                |
| telephone          | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

