class UserSessionsController < ApplicationController
  
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
  		flash[:success] = "Thanks for logging in!"
  	else
      flash[:success] = "There was a problem logging in!"
  		render action: 'new'
  	end
  end
end
