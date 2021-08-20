class RemoveNameFromAdmins < ActiveRecord::Migration[5.0]
  def change
    remove_column :admins, :name, :string
  end
end
