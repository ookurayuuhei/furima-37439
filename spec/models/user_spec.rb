require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmation, first_name, last_name, first_name_kana, last_name_kana, birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailは@を含まないと登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'first_nameは漢字、ひらがな以外は登録できない' do
      end
      it 'last_nameは漢字、ひらがな以外は登録できない' do
      end
      it 'first_name_kanaはカタカナ以外は登録できない' do
      end
      it 'last_name_kanaはカタカナ以外は登録できない' do
      end
      it 'birthdayが空では登録できない' do
      end
    end
  end
end