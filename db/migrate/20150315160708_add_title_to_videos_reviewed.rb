class AddTitleToVideosReviewed < ActiveRecord::Migration
  def change
    add_column :video_reviews, :title, :string
  end
end
