class UsersController < ApplicationController
  before_action :authenticate_user! #ログインしていないと制限される。
  def index
    @users = User.order(id: :desc)
  end

  def show
    @user = User.find(params[:id])
    @reports = @user.reports.order(report_id: :desc)
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path, alert: '不正なアクセスです'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '更新しました'
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
