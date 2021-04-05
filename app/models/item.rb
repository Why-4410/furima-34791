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
    less_than: 9999999
    }
  validates :image, presence: true
  validates :name, :product_text, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }

end