class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video_url
      t.integer :video_type

      t.timestamps null: false
    end
  end
end
