class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @posts = Post.page(params[:page]).per(10)
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :body, :rate, :postal_code, :address, :is_draft, :user_id, :latitude, :longitude, tag_ids: [])
  end

end
