class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to users_my_page_path
  end

  def detain
  end

  def out
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
