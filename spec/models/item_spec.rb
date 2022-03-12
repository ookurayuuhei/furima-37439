require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it '全ての項目が存在すると出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができないとき' do
      it 'imageが空では登録されない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'items_nameが空では出品できない' do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")
        end
        it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end
        it 'category_idが1では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'status_idが1では出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
        end
        it 'delivery_fee_idが1では出品できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
        end
        it 'shipping_area_idが1では出品できない' do
        @item.shipping_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
        end
        it 'shipping_days_idが1では出品できない' do
        @item.shipping_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
        end
        it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字のみ使用できます")
        end
        it 'priceが半角数字以外では出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceが300円未満では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
        end
        it 'priceが10,000,000以上では出品できない' do
        @item.price = '10,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'user情報がない場合出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
        end
      end
    end
  end