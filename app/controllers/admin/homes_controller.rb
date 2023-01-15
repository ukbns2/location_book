class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @tags = Tag.where(status: :false)
    if params[:tag_ids]
      @tag = @tags.find(params[:tag_ids])
      all_posts = @tag.posts
    else
      all_posts = Post.where(is_draft: :false).includes(:tag)
    end
    @posts = params[:tag_ids].present? ? Tag.find(params[:tag_ids]).posts : Post.where(is_draft: :false).order('id DESC').page(params[:page]).per(15)
    @all_posts_count = all_posts.count
  end


  private
  def post_params
    params.require(:post).permit(:image, :title, :body, :rate, :postal_code, :address, :is_draft, :delete, :user_id, :latitude, :longitude, tag_ids: [])
  end

end
