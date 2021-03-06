class UserDonation
  include ActiveModel::Model
  attr_accessor :token, :price, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end
  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, buyer_id: buyer.id)
  end
end