class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc)
  end

  def show
    @user = User.find(params[:id])
    @reports = @user.reports.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
