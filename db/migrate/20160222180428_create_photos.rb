class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :event_id
      t.boolean :is_cover

      t.timestamps null: false
    end
  end
end
