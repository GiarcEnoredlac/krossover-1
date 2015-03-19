class StaticPagesController < ApplicationController
	layout :layout

  def index
  	redirect_to dashboard_path if current_user
  end

  private
  def layout
  	"static_pages"
  end
end
