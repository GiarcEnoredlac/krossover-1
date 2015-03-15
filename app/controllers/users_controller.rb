class UsersController < ApplicationController
  layout :layout

	def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have registered successfully!"
      redirect_to login_path
    else
      render 'new'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, 
    														 :last_name, 
    														 :username,
    														 :email,
    														 :password,
    														 :location,
    														 :videos_reviewed,
    														 :description,
    														 :sash_id,
    														 :level)
  end

  def layout
    "devise"
  end
end
