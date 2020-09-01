class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :state
  belongs_to_active_hash :burden_of_delivery_charge
  belongs_to_active_hash :ship_to_region
  belongs_to_active_hash :day_to_ship
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :state_id
    validates :burden_of_delivery_charge_id
    validates :ship_to_region_id
    validates :day_to_ship_id
    validates :user_id
    validates :price, numericality: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "¥300~¥9,999,999の間の金額にしてください"}
  
  
end
