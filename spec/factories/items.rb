FactoryBot.define do
  factory :item do
    name               {"product"}
    description        {"text"}
    status_id          { 2 }
    delivery_charge_id { 2 }
    prefecture_id      { 2 }
    shipping_day_id    { 2 }
    price              {"300"}
    category_id        { 2 }
  end
end
