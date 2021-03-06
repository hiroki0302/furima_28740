class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :post_code, null: false
      t.integer :ship_to_region_id, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.string :phone_number, null: false
      t.integer :purchase_id, null: false, foreign_key: true
    end
  end
end
