class Item < ApplicationRecord
  belongs_to :user
  has_one :purchases

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :burden_of_delivery_charge
  belongs_to_active_hash :ship_to_region
  belongs_to_active_hash :day_to_ship
  has_one_attached :image


  validates :name, presence: true
end
