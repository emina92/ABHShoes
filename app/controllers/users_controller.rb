class UsersController < AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      @user.add_role :admin if params.has_key?(:admin_option)
      @user.add_role :customer if params.has_key?(:customer_option)
      @user.add_role :customer if !params.has_key?(:customer_option) && !params.has_key?(:admin_option)
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      @user.remove_role :admin
      @user.remove_role :customer
      @user.add_role :admin if params.has_key?(:admin_option)
      @user.add_role :customer if params.has_key?(:customer_option)
      @user.add_role :customer if !params.has_key?(:customer_option) && !params.has_key?(:admin_option)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit 
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
    end
end
