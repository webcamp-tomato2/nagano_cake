class RemoveNamesFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :last_name, :string
    remove_column :customers, :first_name, :string
    remove_column :customers, :last_name_kana, :string
    remove_column :customers, :first_name_kana, :string
    remove_column :customers, :postal_code, :string
    remove_column :customers, :address, :string
    remove_column :customers, :telephone_number, :string
    remove_column :customers, :is_deleted, :boolean
  end
end
