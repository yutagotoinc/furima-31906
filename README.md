# テーブル設計

## usersテーブル

|  Column           |  Type    |  Options      |
|  ----------       |  ------  |  --------     |
|  nickname         |  string  |  null: false  |
|  email            |  string  |  null: false  |
|  password         |  string  |  null: false  |
|  first_name       |  string  |  null: false  |
|  last_name        |  string  |  null: false  |
|  first_name_kana  |  string  |  null: false  |
|  last_name_kana   |  string  |  null: false  |
|  birth_day        |  string  |  null: false  |

## productsテーブル

|  Column           |  Type        |  Options        |
|  ---------        |  ------      |  --------       |
|  name             |  string      |  null: false    |
|  description      |  text        |  null: false    |
|  category         |  integer     |  null: false    |
|  status           |  integer     |  null: false    |
|  shipping_charges |  integer     |  null: false    |
|  shipping_area    |  integer     |  null: false    |
|  days_to_ship     |  integer     |  null: false    |
|  price            |  integer     |  null: false    |
|  user_id          |  references  |  null: false    |
|  image            |  ------      |  ActiveStorage  |

## addressesテーブル

|  Column       |  Type        |  Options      |
|  ----------   |  ------      |  --------     |
|  zip_code     |  string      |  null: false  |
|  prefecture   |  string      |  null: false  |
|  city         |  string      |  null: false  |
|  block_number |  string      |  null: false  |
|  building     |  string      |  null: false  |
|  phone_number |  integer     |  null: false  |
|  user_id      |  references  |  null: false  |

## cardsテーブル

|  Column       |  Type        |  Options      |
|  ----------   |  ------      |  --------     |
|  product_id   |  references  |  null: false  |
|  user_id      |  string      |  null: false  |

## imagesテーブル

|  Column       |  Type        |  Options       |
|  ----------   |  ------      |  --------      |
|  image        |  ------      |  ActiveStorage |
|  product_id   |  references  |  null: false   |



