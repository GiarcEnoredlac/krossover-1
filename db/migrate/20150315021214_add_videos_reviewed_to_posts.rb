class AddVideosReviewedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :videos_reviewed, :integer
  end
end
