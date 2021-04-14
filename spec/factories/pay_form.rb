FactoryBot.define do
  factory :pay_form do
    token {"tok_abcdefghijk00000000000000000"}
    postal_cord {"176-0079"}
    prefecture_id {2}
    sity {"東京都練馬区"}
    house_number {"土支田1-1"}
    phone_number {"08097224410"}
  end
end
