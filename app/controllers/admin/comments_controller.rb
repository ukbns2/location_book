class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.all.order('id DESC').page(params[:page]).per(15)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to admin_comments_path
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
