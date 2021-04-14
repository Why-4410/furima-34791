require 'rails_helper'

RSpec.describe PayForm, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  @pay_form = FactoryBot.build(:pay_form)

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
      expect(@pay_form).to be_valid

  end

  it "都道府県が空では購入できない" do
    @pay_form.prefecture_id = ''
      expect(@pay_form).to be_valid
  end

  it "市区町村が空では購入できない" do
    @pay_form.sity = ''
    expect(@pay_form).to be_valid
  end

  it "番地が空では購入できない" do
    @pay_form.house_number = ''
      expect(@pay_form).to be_valid
  end

  it "電話番号が空では購入できない" do
    @pay_form.phone_number = ''
      expect(@pay_form).to be_valid
  end
end
