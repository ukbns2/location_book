class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
