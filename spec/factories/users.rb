FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {"111aaa"}
    first_name {"白井"}
    last_name {"義人"}
    first_name_k {"シライ"}
    last_name_k {"ヨシト"}
    birth {"1993-08-26"}
    password_confirmation {password}
  end
end

