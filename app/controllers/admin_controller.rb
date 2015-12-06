class AdminController < ApplicationController

	before_filter :check_admin_authentication, :set_no_sidebar
	
  def index
  end

  def check_admin_authentication
    if !@current_user
      redirect_to login_path, notice: "You must be logged in to access that page"
    elsif !@current_user.has_role? (:admin)
    	redirect_to "/"
    end
  end

  def set_no_sidebar
    @no_sidebar = true
  end
end
