class AdminController < ApplicationController

	before_filter:check_admin_authentication
	
  def index
  end

  def check_admin_authentication
  	@current_user ||=User.find(session[:user_id]) if session[:user_id]
    if !@current_user
      redirect_to login_path, notice: "You must be logged in to access that page"
    elsif !@current_user.has_role? (:admin)
    	redirect_to "/"
    end
  end
end
