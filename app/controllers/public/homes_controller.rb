class Public::HomesController < ApplicationController
  def top
    @tags = Tag.where(status: :false)
    if params[:tag_ids]
      @tag = @tags.find(params[:tag_ids])
      all_posts = @tag.posts
    else
      all_posts = Post.where(is_draft: :false).includes(:tag)
    end
    @posts = params[:tag_ids].present? ? Tag.find(params[:tag_ids]).posts : Post.where(is_draft: :false).order('id DESC').page(params[:page]).per(4)
    @all_posts_count = all_posts.count
  end

  def about
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :body, :rate, :postal_code, :address, :is_draft, :deleted, :user_id, :latitude, :longitude, tag_ids: [])
  end


end
