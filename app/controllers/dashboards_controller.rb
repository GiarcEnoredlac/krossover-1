class DashboardsController < ApplicationController
	before_action :authenticate_user!
	
  def index
  	@users = User.top_25_in_points.limit(10)
  end
end
