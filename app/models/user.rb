class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥]/ }
  validates :first_name, presence: true
  validates :second_name, format: {with: /\A[ぁ-んァ-ヶ一-龥]/ }
  validates :second_name, presence: true
  validates :first_kana_name, format: {with: /\p{katakana}/}
  validates :first_kana_name, presence: true
  validates :second_kana_name,format: {with: /\p{katakana}/}
  validates :second_kana_name,presence: true
  validates :birthday, presence: true

end

