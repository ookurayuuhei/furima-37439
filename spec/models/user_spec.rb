require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
  it 'emailが空では登録できない' do
  end
  it 'passwordが空では登録できない' do
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
  # pending "add some examples to (or delete) #{__FILE__}"
  end
end