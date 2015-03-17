class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :add_badge_10

  def require_user
    redirect_to login_path unless current_user
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def add_badge_10
    User.all.each do |user|
      unless Merit::Badge.find(10).users
        user.badges.each do |badge|
          unless Merit::Badge.find(10) == badge
            if user.videos_reviewed >= 400
              user.add_badge(10)
            end
          end
        end
      end
    end
  end
 

	

  

  helper_method :current_user

end
