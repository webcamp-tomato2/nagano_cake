class RenameStatusColumnToGenres < ActiveRecord::Migration[5.2]
  def change
    rename_column :genres, :status, :image_id
  end
end
