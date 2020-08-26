class Item < ApplicationRecord
  belongs_to :user
  has_one :purchases

  validates :name, presence: true
end
