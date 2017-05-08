class ChangeNewDefaultNameArticles < ActiveRecord::Migration
  def change
  	change_column :articles, :name, :string, :default => nil
  end
end
