class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      
      t.string :email, null: false
      t.string :encrypted_password, null: false
      
      t.timestamps　null: false
    end
  end
end
