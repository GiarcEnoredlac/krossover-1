class AddDefaultToReviews < ActiveRecord::Migration
  def change
  	change_column_default :reviews, :game_length, 0
  	change_column_default :reviews, :review_length, 0
  	change_column_default :reviews, :number_of_plays, 0
  	change_column_default :reviews, :correct_plays, 0
  end
end
