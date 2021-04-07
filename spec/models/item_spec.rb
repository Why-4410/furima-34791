require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき'
    it '商品画像が１枚ついていれば出品できる' do
      expect(@item).to be_valid
    end
    it '商品名が入力されていれば登録できる' do
      @item.name = "古着"
      expect(@item).to be_valid
    end
    it '商品説明が入力されていれば登録できる' do
      @item.product_text = "着なくなった洋服"
      expect(@item).to be_valid
    end
    it 'カテゴリー情報に1以外を選択すれば登録できる' do
      @item.category_id = 2
      expect(@item).to be_valid
    end
    it '商品状態の情報に1以外を選択すれば登録できる' do
      @item.condition_id = 2
      expect(@item).to be_valid
    end
    it '配送料の負担情報に1以外を選択すれば登録できる' do
      @item.delivery_fee_id = 2
      expect(@item).to be_valid
    end
    it '発送元の地域の情報に1以外を選択すれば登録できる' do
      @item.prefecture_id = 2
      expect(@item).to be_valid
    end
    it '発送までの日数の情報に1以外を選択すれば登録できる' do
      @item.delivery_day_id = 2
      expect(@item).to be_valid
    end
    it '販売価格を¥300~¥9999999の間で入力されていれば登録できる' do
      @item.price = 1000
      expect(@item).to be_valid
    end
    it '販売価格が半角数字で入力されていれば登録できる' do
      @item.price = 1000
      expect(@item).to be_valid
    end
  end

    context '新規登録出来ないとき' do
    it '商品画像をつけていなければ登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品説明が空では登録できない' do
      @item.product_text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product text can't be blank")
    end
    it 'カテゴリー情報が1では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品状態の情報が1では登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it '配送料の負担情報が1では登録できない' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
    end
    it '発送元の地域の情報が1では登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '発送までの日数の情報が1では登録できない' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
    end
    it '販売価格が¥300未満だと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '販売価格が¥9999999を超えると登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it '販売価格は半角数字以外では登録できない' do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it '販売価格は半角英数混合では登録できない' do
      @item.price = '1a1a'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it '半角英語だけでは登録できない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
