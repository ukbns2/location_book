class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
    #redirect_to detail_post_path(post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    #redirect_to detail_post_path(params[:post_id])
  end

  def index
    @user = current_user
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

end

