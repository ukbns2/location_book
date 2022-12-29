class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :body, :rate, :postal_code, :address, :is_draft, :user_id, :latitude, :longitude, tag_ids: [])
  end

end
