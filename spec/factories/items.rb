FactoryBot.define do
  factory :item do
    name               {"product"}
    description        {"text"}
    status_id          { 2 }
    delivery_charge_id { 2 }
    prefectures_id     { 2 }
    shipping_days_id   { 2 }
    price              {"300"}
  end
end
