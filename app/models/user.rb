class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :password, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :password, length: { minimum: 6}
  validates :first_name, format: {with:  /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name, presence: true
  validates :second_name, format: {with:  /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :second_name, presence: true
  validates :first_kana_name, format: {with: /\p{katakana}/}
  validates :first_kana_name, presence: true
  validates :second_kana_name,format: {with: /\p{katakana}/}
  validates :second_kana_name,presence: true
  validates :birthday, presence: true

  FactoryBot.define do
    factory :user do
      name                  {Faker::Name.initials(number: 10)}
      email                 {Faker::Internet.free_email}
      password              {'mune0717'}
      first_name            { "山田"}
      first_kana_name       { "ヤマダ"}
      second_name           { "太郎"}
      second_kana_name      { "タロウ"}
      birthday              {"1932-02-03"}
    end
  end
end

