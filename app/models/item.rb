class Item < ApplicationRecord

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :status_id
    validates :delivery_charge_id
    validates :prefectures_id
    validates :shipping_days_id
    validates :price, inclusion: { within: 300 .. 9999999 }, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end
end
