# README
# テーブル設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false, unique: true, index: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_kana|string|null: false|
|first_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|

### Assosiation
- has_one :credit_card, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :comments

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|

### Assosiation
- belongs_to :user

## sending_destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|
|phone_number|string|null: false|
|user|references|null: false, foreign_key: true|

### Assosiation
- belongs_to :user

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
|item_description|string|
|item_condition_id|integer|null: false, foreign_key: true|
|postage_payer_id|integer|null: false, foreign_key: true|
|preparation_day_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
|buyer|references|foreign_key: true|
|seller|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|brand|integer|foreign_key: true|
|image|references|null: false, foreign_key: true|

### Assosiation
- has_many :item_images, dependent: :destroy
- has_many :comments, dependent: :destroy
- belongs_to :category
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :brand

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Assosiation
- has_many :items
- has_ancestry

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item|references|null: false, foreign_key: true|

### Assosiation
- belongs_to :item

gem => 'active_hash',  'ancestry'


