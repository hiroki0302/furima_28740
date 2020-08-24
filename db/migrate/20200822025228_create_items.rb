class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :categories, null: false
      t.integer :state, null: false
      t.integer :burden_of_delivery_charges, null: false
      t.integer :ship_to_region, null: false
      t.integer :day_to_ship, null: false
      t.integer :price, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
