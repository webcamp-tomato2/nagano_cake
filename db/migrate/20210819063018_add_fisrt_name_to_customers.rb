class AddFisrtNameToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :first_name, :string
    
  end
end
