require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nameが空だと登録できない" do
      user = User.new(name: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "山田", second_name: "一郎", first_kana_name: "ヤマダ", second_kana_name: "イチロウ", birthday: "1932-02-03")
      user.valid?
      binding.pry
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it "first_nameが空だと登録できない"do
      user = User.new(name: "furima", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "", second_name: "一郎", first_kana_name: "ヤマダ", second_kana_name: "イチロウ", birthday: "1932-02-03")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameが空だと登録できない"do
      user = User.new(name: "furima", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "", second_name: "一郎", first_kana_name: "ヤマダ", second_kana_name: "イチロウ", birthday: "1932-02-03")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it"second_nameが空だと登録できない"do
      user = User.new(name: "furima", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "山田", second_name: "", first_kana_name: "ヤマダ", second_kana_name: "イチロウ", birthday: "1932-02-03")
      user.valid?
      expect(user.errors.full_messages).to include("Second name can't be blank")
    end
    it"firsr_kara_nameが空だと登録できない"do
      user = User.new(name: "furima", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "山田", second_name: "一郎", first_kana_name: "", second_kana_name: "イチロウ", birthday: "1932-02-03")
      user.valid?
      expect(user.errors.full_messages).to include("First kana name can't be blank")
    end
    it"second_kara_nameが空だと登録できない"do
      user = User.new(name: "furima", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "山田", second_name: "一郎", first_kana_name: "ヤマダ", second_kana_name: "", birthday: "1932-02-03")
      user.valid?
      expect(user.errors.full_messages).to include("Second kana name can't be blank")
    end
    it"birthdayが空だと登録できない"do
      user = User.new(name: "furima", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name: "山田", second_name: "一郎", first_kana_name: "ヤマダ", second_kana_name: "イチロウ", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
 end
end