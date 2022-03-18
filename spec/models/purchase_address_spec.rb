require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    context '購入ができる時' do
      it 'すべての値が正しく入力されていれば登録できること' do
        expect(@purchase).to be_valid
      end
      it '建物名は空でも登録できること' do
        @purchase.build = ''
        expect(@purchase).to be_valid
      end
    end
    context '購入ができない時' do
      it '郵便番号が空では登録できないこと' do
        @purchase.post_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号に全角文字が含まれている場合登録できないこと' do
        @purchase.post_number = '123-ああああ'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Post number is invalid')
      end
      it '郵便番号に半角文字が含まれている場合登録できない' do
        @purchase.post_number = '123-ｱｱｱｱ'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Post number is invalid')
      end
      it '郵便番号にハイフン以外の記号が含まれている場合登録できない' do
        @purchase.post_number = '123-.,:@'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Post number is invalid')
      end
      it '郵便番号にハイフンが含まれていない場合登録できない' do
        @purchase.post_number = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Post number is invalid')
      end
      it '都道府県が空では登録できないこと' do
        @purchase.shipping_area_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '市町村区が空では登録できないこと' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できないこと' do
        @purchase.address = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が12桁以上の場合登録できないこと' do
        @purchase.phone_number = '123456789011'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it '電話番号に全角文字が含まれている場合登録できないこと' do
        @purchase.phone_number = '12345ああああ'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is not a number')
      end
      it '電話番号に全角数字が含まれている場合登録できないこと' do
        @purchase.phone_number = '12345６７８９'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is not a number')
      end
      it '電話番号に半角文字が含まれている場合登録できないこと' do
        @purchase.phone_number = '1234aaaa'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is not a number')
      end
      it '電話番号に記号が含まれている場合登録できないこと' do
        @purchase.phone_number = '1234-5678'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is not a number')
      end
      it 'tokenが空では登録できないこと' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'item_idが空では登録できない' do
        @purchase.item_id = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空では登録できない' do
        @purchase.user_id = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end