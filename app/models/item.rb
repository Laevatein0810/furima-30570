class Item < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_one :buyer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_charge

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, inclusion: { within: 300 .. 9999999 }, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end
  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :category_id
  end
end
