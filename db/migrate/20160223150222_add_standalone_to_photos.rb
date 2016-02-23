class AddStandaloneToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :standalone, :boolean, default: false
  end
end
