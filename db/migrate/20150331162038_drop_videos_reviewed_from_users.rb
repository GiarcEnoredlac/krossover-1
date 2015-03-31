class DropVideosReviewedFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :videos_reviewed
  end
end
