require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
     context '内容に問題がない場合' do
        it 'すべて値が正しく入力されている時' do
          expect(@item).to be_valid
        end
      end
      context '内容に問題がある場合'do
        it 'userが紐付いていない時' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
        it '商品名が空では登録できない' do
          @item.title = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end
        it '商品説明が空では登録できない' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include ("Explanation can't be blank")
        end
        
        it 'カテゴリーのIDが1だと登録できない' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it '商品の状態のIDが1だと登録できない' do
          @item.situation_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Situation can't be blank")
        end
        it '配送料の負担のIDが1だと登録できない' do
          @item.shipingcost_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipingcost can't be blank")
        end
        it '配送の地域IDが1だと登録できない' do
          @item.area_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Area can't be blank")
        end
        it '発送までの日数のIDが1だと登録できない' do
          @item.timeship_id  = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Timeship can't be blank")
        end
        it '販売価格が0だと登録できない' do
          @item.cost = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost can't be blank")
        end
        it '販売価格が範囲外(¥9,999,999より多い)だと登録できない' do
          @item.cost = '999999999999999999999999999'
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost must be less than or equal to 9999999")
        end
        it '販売価格が範囲外(¥300より小さい)だと登録できない' do
          @item.cost = '200'
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost must be greater than or equal to 300")
        end
        it '販売価格が全角だと登録できない' do
          @item.cost = "３００００００００００００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost is not a number")
        end
      end
  end
end
