class EditLocationToIntegerInUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :location
  	add_column :users, :location, :integer
  end
end
