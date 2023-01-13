class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
