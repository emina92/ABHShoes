class RegistrationController < ApplicationController

  before_filter :set_no_sidebar
  
  def new
    @user = User.new
  end

 
  def create
    @user = User.new(user_params)
    if @user.save
      @user.add_role :customer
      flash[:notice] = 'Account created successfully'
      redirect_to '/login'
    else
      render 'new'
    end
  end

  def set_no_sidebar
    @no_sidebar = true
  end

  private
    def user_params
      params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
    end
end
