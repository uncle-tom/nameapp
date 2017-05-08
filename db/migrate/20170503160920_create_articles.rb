class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|

      t.timestamps null: false
      t.string :name, default:'Милевский Тема'
      t.string :url 
      t.text :text
      t.integer :user_id
    end
  end
end
