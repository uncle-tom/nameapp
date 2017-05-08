class AddNewColumnForUser < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :phone_number, :integer
  	add_column :users, :city, :string
  	add_column :users, :website, :string
  end
end
