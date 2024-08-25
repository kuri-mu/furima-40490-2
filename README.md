# README
# テーブル設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_kana|string|null: false|
|last_kana|string|null: false|
|birth_date|date|null: false|


### Assosiation
- has_many :items
- has_many :purchase_histories

### Assosiation

## sending_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number|string|null: false|
|users|references|null: false, foreign_key: ture|

### Assosiation
- belongs_to :purchase_histories

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Assosiation
- belongs_to :user
- belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|item_description|text|null: false|
|item_condition_id|integer|null: false|
|postage_payer_id|integer|null: false|
|preparation_day_id|integer|null: false|
|prefecture_id|integer|null: false|
|category_id|integer|null: false|
|user|references|null: false, foreign_key: true|


### Assosiation
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :prefecture
- belongs_to :user
- has_one:purchase_histories


## purchase_historiesテーブル(購入履歴)
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Assosiation
- belongs_to :user
- belongs_to :item
- has_one :sending_destinations
