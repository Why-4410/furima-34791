require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  @addresses = FactoryBot.build(:addresses)

  describe "商品購入" do

    context '商品購入できる時'

    it "priceとtokenがあれば保存ができること" do
      expect(@addresses).to be_valid
    end

    it "tokenが空では登録できないこと" do
      @addresses.token = nil
      @addresses.valid?
      expect(@addresses.errors.full_messages).to include("Token can't be blank")
    end

    it "郵便番号を入力すれば購入できる" do
      @addresses.postal_cord = '176-0079'
      expect(@addresses).to be_valid
    end

    it "都道府県を入力すれば登録できる" do
      @addresses.prefecture_id = 2
      expect(@addresses).to be_valid
    end

    it "市区町村を入力すれば登録できる" do
      @addresses.sity = '練馬区'
      expect(@addresses).to be_valid
    end

    it "番地を入力すれば登録できる" do
      @addresses.house_number = '練馬区１'
      expect(@addresses).to be_valid
    end

    it "電話番号を入力すれば登録できる" do
      @addresses.phone_number = '08097224410'
      expect(@addresses).to be_valid
    end
  end

  context '商品購入できない時'

  it "カード情報が空では購入できない" do
  end

  it "有効期限が空では購入できない" do
  end

  it "セキュリティコードが空では購入できない" do
  end

  it "郵便番号が空では購入できない" do
    @addresses.postal_cord = ''
      expect(@addresses).to be_valid

  end

  it "都道府県が空では購入できない" do
    @addresses.prefecture_id = ''
      expect(@addresses).to be_valid
  end

  it "市区町村が空では購入できない" do
    @addresses.sity = ''
    expect(@addresses).to be_valid
  end

  it "番地が空では購入できない" do
    @addresses.house_number = ''
      expect(@addresses).to be_valid
  end

  it "電話番号が空では購入できない" do
    @addresses.phone_number = ''
      expect(@addresses).to be_valid
  end
end
