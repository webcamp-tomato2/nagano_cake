class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer :price, null:false
      t.integer :amount, null:false
      t.integer :making_status, null:false, default: 0

      t.timestamps null:false
    end
  end
end
