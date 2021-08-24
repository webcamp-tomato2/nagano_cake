class AddImageIdToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :status, :string
  end
end
