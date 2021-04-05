class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  has_one :order
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :name,
    presence: true,
    length: {maximum: 40}

  validates :product_text,
    presence: true,
    length: {maximum: 1000}
  
  validates :price,
    numericality: {
    greater_than_or_equal_to: 300,
    less_than: 10000000
    }

  with_options numericality: { other_than:1} do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_day_id

  end
  validates :image, presence: true
end