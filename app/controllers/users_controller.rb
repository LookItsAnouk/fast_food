class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = current_user
  end

  def dashboard
    @user = current_user
    #redirect_to 
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    # @user = current_user
  end

  # # POST /users
  # def create
  #   @user = User.new(user_params)
  #     if @user.save
  #       redirect_to user_url(@user), notice: "User was successfully created." 
  #     else
  #       render :new, status: :unprocessable_entity 
  #     end
  # end

#If that above gives errors, try the below:
  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    # @user = current_user

    if @user.update(user_params)
      redirect_to user_url(@user), notice: "User was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
      redirect_to users_url, notice: "User was successfully destroyed." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(
        :first_name, 
        :last_name, 
        :email, 
        :password, 
        :password_confirmation, 
        :address, 
        :phone, 
        :is_cook?)
    end
end
