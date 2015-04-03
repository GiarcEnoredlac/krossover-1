class ChangePointsInUserToPointsVideo < ActiveRecord::Migration
  def change
  	rename_column :users, :points, :leaderboard_points
  end
end
