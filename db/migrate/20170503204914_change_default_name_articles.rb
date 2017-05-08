class ChangeDefaultNameArticles < ActiveRecord::Migration
  def change
  	change_column :articles, :name, :string 
  end
end
