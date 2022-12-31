class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @posts = Post.order('id DESC').page(params[:page]).per(12)
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :body, :rate, :postal_code, :address, :is_draft, :delete, :user_id, :latitude, :longitude, tag_ids: [])
  end

end
