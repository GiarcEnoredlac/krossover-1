class AddDataToReviews < ActiveRecord::Migration
  def change
  	add_column :reviews, :game_length, :integer
  	add_column :reviews, :review_length, :integer
  	add_column :reviews, :number_of_plays, :integer
  	add_column :reviews, :correct_plays, :integer
  end
end
