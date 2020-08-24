class Shipping < ApplicationRecord
  belongs_to :purchases

  validates :name, presence: true
end
