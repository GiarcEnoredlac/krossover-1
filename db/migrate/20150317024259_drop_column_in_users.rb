class DropColumnInUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :videos_reviewed
  	add_column :users, :videos_reviewed, :integer
  end
end
