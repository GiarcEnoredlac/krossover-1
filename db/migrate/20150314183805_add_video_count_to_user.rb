class AddVideoCountToUser < ActiveRecord::Migration
  def change
  	add_column :users, :videos_reviewed, :integer
  end
end
