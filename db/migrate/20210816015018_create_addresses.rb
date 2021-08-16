class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :postal_code,null: false
      t.string :address, null: false
      t.timestamps null: false
    end
  end
end
