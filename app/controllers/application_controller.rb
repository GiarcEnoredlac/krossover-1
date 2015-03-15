class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_user
    redirect_to login_path unless current_user
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?
    
  end
 

	#Allow Devise to add custom fields in database
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  protected
  def configure_devise_permitted_parameters
    registration_params = [:first_name,
                           :last_name,
                           :username,
                           :email, 
                           :location,
                           :videos_reviewed,
                           :password, 
                           :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :first_name,
                                            :last_name,
                                            :username,
                                            :email, 
                                            :location,
                                            :videos_reviewed,
        																		:password, 
                                            :password_confirmation, 
                                            :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
  # End Devise ############# 

  def after_sign_in_path_for(resource)
    if current_admin
      root_path
    elsif current_user
      root_path
    end
  end

  helper_method :current_user

end
