class LeaderboardsController < ApplicationController

	def index
		@users = User.joins(:reviews).group('reviews.user_id, users.id').order("count(reviews.user_id) DESC")
	end

end
