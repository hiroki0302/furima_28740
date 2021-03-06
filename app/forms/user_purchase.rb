class UserPurchase

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code,:ship_to_region_id,:city,:block,:building,:phone_number,:purchase_id, :item, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :ship_to_region_id
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A\d{11}\z/, message:"半角数字で入力してください"}
    validates :user_id
    validates :item_id
  end

  def save
    
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Shipping.create(post_code: post_code, ship_to_region_id: ship_to_region_id, city: city, 
      building: building, block: block, phone_number: phone_number, purchase_id: purchase.id)
  end

end