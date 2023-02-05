class Public::SearchesController < ApplicationController
  # def search
  #   @posts = Post.search(params[:keyword])
  #   @keyword = params[:keyword]
  # end

  def search
    @posts = Post.where(is_draft: :false).looks(params[:search], params[:keyword]).order('id DESC').page(params[:page]).per(12)
  end
end
