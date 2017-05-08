class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|

      t.timestamps null: false
      t.string :name
      t.string :what_date
      t.integer :user_id
    end
  end
end
