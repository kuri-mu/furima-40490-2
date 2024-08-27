class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :nickname, presence: true
validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
validates :first_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
validates :last_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
validates :birth_date, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }

# パスワードのバリデーション。
validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: 'is invalid, must include both letters and numbers' }

# 名前フィールドのバリデーションを修正
validates :first_name, :last_name, format: { with: /\A[^\x01-\x7Eｧ-ﾝﾞﾟ]+\z/, message: 'must be full-width characters' }
end