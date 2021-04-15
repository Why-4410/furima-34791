require 'rails_helper'

RSpec.describe PayForm, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @pay_form = FactoryBot.build(:pay_form, user_id:@user, item_id:@item)
    sleep 0.1
  end
  describe "商品購入" do

    context '商品購入できる時'

    it "priceとtokenがあれば保存ができること" do
      expect(@pay_form).to be_valid
    end

    it "tokenが空では登録できないこと" do
      @pay_form.token = nil
      @pay_form.valid?
      expect(@pay_form.errors.full_messages).to include("Token can't be blank")
    end

    


  context '商品購入できない時'
  it "郵便番号を入力すれば購入できる" do
    @pay_form.postal_cord = '176-0079'
    expect(@pay_form).to be_valid
  end

  it "都道府県を入力すれば登録できる" do
    @pay_form.prefecture_id = 2
    expect(@pay_form).to be_valid
  end

  it "市区町村を入力すれば登録できる" do
    @pay_form.sity = '練馬区'
    expect(@pay_form).to be_valid
  end

  it "番地を入力すれば登録できる" do
    @pay_form.house_number = '練馬区１'
    expect(@pay_form).to be_valid
  end

  it "電話番号を入力すれば登録できる" do
    @pay_form.phone_number = '08097224410'
    expect(@pay_form).to be_valid
  end

  it "郵便番号が空では購入できない" do
    @pay_form.postal_cord = ''
    @pay_form.valid?
    expect(@pay_form.errors.full_messages).to include("Postal cord ハイフンを入れてください")

  end

  it "都道府県が空では購入できない" do
    @pay_form.prefecture_id = ''
    @pay_form.valid?
    expect(@pay_form.errors.full_messages).to include("Prefecture can't be blank")
  end

  it "市区町村が空では購入できない" do
    @pay_form.sity = ''
    @pay_form.valid?
    expect(@pay_form.errors.full_messages).to include("Sity can't be blank")
  end

  it "番地が空では購入できない" do
    @pay_form.house_number = ''
    @pay_form.valid?
    expect(@pay_form.errors.full_messages).to include("House number can't be blank")
  end

  it "電話番号が空では購入できない" do
    @pay_form.phone_number = ''
    @pay_form.valid?
    expect(@pay_form.errors.full_messages).to include("Phone number can't be blank")
  end

  it "都道府県に「---」が選択されているときは購入できない" do
    @pay_form.prefecture_id = 1
    @pay_form.valid?
    expect(@pay_form.errors.full_messages).to include("Prefecture must be other than 1")
  end


  it "郵便番号にハイフンがないと登録できない" do
  @pay_form.postal_cord = '1111111'
  @pay_form.valid?
  expect(@pay_form.errors.full_messages).to include("Postal cord ハイフンを入れてください")
  end

  it "電話番号が12桁以上では登録できない" do
    @pay_form.phone_number = "080123456789"
    @pay_form.valid?
    expect(@pay_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
  end

  it "電話番号が英数字混合では登録できない" do
    @pay_form.phone_number = "aaa12345678"
    @pay_form.valid?
    expect(@pay_form.errors.full_messages).to include("Phone number 半角数字のみで入力してください")
  end

  it "user_idが空では登録できない" do
    @pay_form.user_id = ''
    @pay_form.valid?
    expect(@pay_form.errors.full_messages).to include("User can't be blank")
  end

  it "item_idが空では登録できない" do
    @pay_form.item_id = ''
    @pay_form.valid?
    expect(@pay_form.errors.full_messages).to include("Item can't be blank")
  end

  it "tokenが空では登録できない" do
    @pay_form.token = ''
    @pay_form.valid?
    expect(@pay_form.errors.full_messages).to include("Token can't be blank")
  end

end
end

