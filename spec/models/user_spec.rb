require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
     context '内容に問題がない場合' do
        it 'すべて値が正しく入力されている時' do
          expect(@user).to be_valid
        end
      end
      context '内容に問題がある場合'do
        it 'ユーザ名が空では登録できない' do
          @user.name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Name can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Email can't be blank")
        end
        it 'Passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'パスワードは半角英字でないと登録できない' do
          @user.password = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it 'パスワードは全角だと登録できない' do
          @user.password = 'TEST'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it 'パスワードと確認用のパスワードが不一致の場合登録できない' do
          @user.password_confirmation = '' 
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'firstnameが空だと登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("First name can't be blank")
        end
        it 'firstnameが全角でないと登録できない' do
          @user.first_name = 'yamada'
          @user.valid?
          expect(@user.errors.full_messages).to include ("First name is invalid")
        end
        it 'secondnameが空だと登録できない' do
          @user.second_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Second name can't be blank")
        end
        it 'secondnameが全角でないと登録できない' do
          @user.second_name = 'ichirou'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Second name is invalid")
        end
        it 'first_kana_nameが空だと登録できない' do
          @user.first_kana_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("First kana name can't be blank")
        end
        it 'first_kana_nameが全角登録できない' do
          @user.first_kana_name = 'yamada'
          @user.valid?
          expect(@user.errors.full_messages).to include ("First kana name is invalid")
        end
        it 'second_kana_nameが空だと登録できない' do
          @user.first_kana_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("First kana name can't be blank")
        end
        it 'second_kana_nameが全角登録できない' do
          @user.first_kana_name = 'ichirou'
          @user.valid?
          expect(@user.errors.full_messages).to include ("First kana name is invalid")
        end
        it '生年月日が空だと登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Birthday can't be blank")
        end
      end
  end
end