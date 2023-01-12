class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
