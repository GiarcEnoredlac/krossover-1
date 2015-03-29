class LeaderboardsController < ApplicationController

	def index
		@users = User.joins(:reviews).select("users.*").group('reviews.user_id').order("count(reviews.user_id) DESC")
	end

end
# @albums = Album.joins(:reviews).select("*, avg(reviews.rating) as average_rating").group("albums.id").order("average_rating DESC")
# @albums = Album.joins(:reviews).select("albums.*, avg(reviews.rating) as average_rating").group("albums.id").order("average_rating DESC")