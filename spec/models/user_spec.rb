require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき'
    it 'emailに＠が含まれていれば登録できる' do
      @user.email = 'test01@test.com'
    end
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが6文字以上で半角英数字混合であれば登録できる' do
      @user.password = '111aaa'
      @user.password_confirmation = '111aaa'
      expect(@user).to be_valid
    end
    it '生年月日が入力されていれば登録できる' do
      @user.birth = "1993-08-26"
    end
    it 'ファーストネームが入力されていれば登録できる' do
      @user.first_name = "白井"
    end
    it 'ラストネームが入力されていれば登録できる' do
      @user.last_name = "義人"
    end
    it 'ファーストネームのカナが入力されていれば登録できる' do
      @user.first_name_k = "シライ"
    end
    it 'ラストネームのカナが入力されていれば登録できる' do
      @user.last_name_k = "ヨシト"
    end
  end

  context '新規登録出来ないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに@が含まれていない場合登録できない' do
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      expect(@user).to be_valid
    end
    it 'passwordに半角英数字混同で入力しなければ登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password には英字と数字の両方を含めて設定してください", "Password confirmation doesn't match Password")
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it '生年月日が空では登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
    it 'ファーストネームが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'ラストネームが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'ファーストネームのカナが空では登録できない' do
      @user.first_name_k = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k can't be blank")
    end
    it 'ラストネームのカナが空では登録できない' do
      @user.last_name_k = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name k can't be blank")
    end
  end
end