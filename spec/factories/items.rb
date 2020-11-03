FactoryBot.define do
  factory :item do
    name               {"product"}
    description        {"text"}
    status_id          {"good"}
    delivery_charge_id {"delivery"}
    prefectures_id     {"city"}
    shipping_days_id   {"0days"}
    price              {"300"}
  end
end
