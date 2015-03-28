class LeaderboardsController < ApplicationController

	def index
		@users = User.joins(:reviews).group('reviews.user_id').order("count(reviews.user_id) DESC")
	end

end
