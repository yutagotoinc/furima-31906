# テーブル設計

## usersテーブル

|  Column             |  Type    |  Options                   |
|  ----------         |  ------  |  --------                  |
|  nickname           |  string  |  null: false               |
|  email              |  string  |  null: false , unique: true|
|  password           |  string  |  null: false               |
|  encrypted_password |  string  |  null: false               |
## deviseのgemを使用しての実装になるため、deviseが予め用意しているencrypted_passwordというカラムを用意してあげましょう。
## 上記、レビューがあったため、追加しました
|  first_name         |  string  |  null: false               |
|  last_name          |  string  |  null: false               |
|  first_name_kana    |  string  |  null: false               |
|  last_name_kana     |  string  |  null: false               |
|  birth_day          |  date    |  null: false               |

## productsテーブル

|  Column              |  Type        |  Options            |
|  ---------           |  ------      |  --------           |
|  name                |  string      |  null: false        |
|  description         |  text        |  null: false        |
|  category_id         |  integer     |  null: false        |
|  status_id           |  integer     |  null: false        |
|  charge_id           |  integer     |  null: false        |
|  area_id             |  integer     |  null: false        |
|  duration_id         |  integer     |  null: false        |
|  price               |  integer     |  null: false        |
|  user                |  references  |  foreign_key: true  |

## addressesテーブル

|  Column        |  Type        |  Options            |
|  ----------    |  ------      |  --------           |
|  zip_code      |  string      |  null: false        |
|  prefecture_id |  integer     |  null: false        |
|  city          |  string      |  null: false        |
|  block_number  |  string      |  null: false        |
|  building      |  string      |  -----------        |
|  phone_number  |  integer     |  null: false        |
|  order         |  references  |  foreign_key: true  |

## ordersテーブル

|  Column       |  Type        |  Options            |
|  ----------   |  ------      |  --------           |
|  user         |  references  |  foreign_key: true  |
|  product      |  references  |  foreign_key: true  |


