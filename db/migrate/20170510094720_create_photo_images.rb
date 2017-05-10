class CreatePhotoImages < ActiveRecord::Migration
  def change
    create_table :photo_images do |t|
			t.integer  "album_id"
	    t.string   "name"
	    t.string   "description"
	    t.integer  "user_id"
	    t.string   "image"
      t.timestamps null: false
    end
  end
end
