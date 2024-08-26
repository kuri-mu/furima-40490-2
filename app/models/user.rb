class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

   has_many :items
   has_many :purchase_histories

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,           presence: true
         validates :email,              presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
         validates :encrypted_password, presence: true, length: { minimum: 6 }
         validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :first_kana,         presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
         validates :last_kana,          presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
         validates :last_kana,          presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
         validates :birth_date,         presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
end
