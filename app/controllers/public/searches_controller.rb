class Public::SearchesController < ApplicationController
  # def search
  #   @posts = Post.search(params[:keyword])
  #   @keyword = params[:keyword]
  # end

  def search
    @posts = Post.looks(params[:search], params[:keyword])
  end
end
