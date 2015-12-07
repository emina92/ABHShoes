class UserSessionsController < ApplicationController

  before_filter :set_no_sidebar

  def new
  end

  def destroy
    log_out
    redirect_to login_path
  end

  def create
  	user = User.find_by(email: params[:email])

  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
      redirect_to user
  	else
      @bad_access = true
  		render action: 'new'
  	end
  end

  def set_no_sidebar
    @no_sidebar = true
  end

end
