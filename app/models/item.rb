class Item < ApplicationRecord

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, inclusion: { within: 300 .. 9999999 }, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end
  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :delivery_charge_id
    validates :prefectures_id
    validates :shipping_days_id
  end
end
