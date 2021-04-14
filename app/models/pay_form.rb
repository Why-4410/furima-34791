class PayForm
  include ActiveModel::Model
  # attr_accessor :price, :user_id, :postal_cord, :prefecture, :sity, :house_number, :building
  attr_accessor :postal_cord, :prefecture_id, :sity, :house_number, :building, :phone_number, :user_id, :item_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :prefecture_id
    validates :sity
    validates :house_number
    validates :phone_number, length: {maximum: 11}
    validates :token
    validates :user_id
    validates :item_id
  end

  with_options format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフンを入れてください' } do
    validates :postal_cord
  end

  validates :phone_number, format: { with: /\A\d{11}\z/, message: '11ケタ以内で入力してください' } do
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_cord: postal_cord, prefecture_id: prefecture_id, sity: sity, house_number: house_number, building: building, order_id: order.id, phone_number: phone_number)
  end
end