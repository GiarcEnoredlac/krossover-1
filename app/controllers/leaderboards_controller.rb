class LeaderboardsController < ApplicationController

	def index
		@users = User.all.order("videos_reviewed DESC")
	end

end
