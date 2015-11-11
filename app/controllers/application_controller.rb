class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_filter :set_current_user
  
  def set_current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

  def check_authentication
    unless @current_user
      redirect_to login_path, notice: "You must be logged in to access that page" 
    end
  end

  def log_out
    session.delete(:user_id)
  end
  
end
