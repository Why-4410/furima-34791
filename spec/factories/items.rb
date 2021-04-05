FactoryBot.define do
  factory :item do
    name {"古着"}
    product_text {"着なくなった洋服"}
    category_id {2}
    condition_id {2}
    delivery_fee_id {2}
    prefecture_id {2}
    delivery_day_id {2}
    price {1000}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
