class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :event_date
      t.string :video_url
      t.boolean :is_prior

      t.timestamps null: false
    end
  end
end
