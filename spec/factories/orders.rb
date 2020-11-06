FactoryBot.define do
  factory :order do
    token {"token_abcdefghijklm0000000000000"}
    postal_code {"000-0000"}
    city {"あああ"}
    address {"1-1-1"}
    phone_number {"09012345678"}
    prefecture_id { 2 }
  end
end
