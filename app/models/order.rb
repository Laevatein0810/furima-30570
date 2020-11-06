class Order
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
  end
end
