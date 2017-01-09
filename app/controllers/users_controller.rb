class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find_by_id params[:id]
    if @user.nil?
      flash[:warning] = "User not found!"
      redirect_to help_path
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
