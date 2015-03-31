class LeaderboardsController < ApplicationController

	def index
		@users = User.top_25_in_points
	end

end