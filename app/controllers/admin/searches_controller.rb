class Admin::SearchesController < ApplicationController
  def search
    @posts = Post.looks(params[:search], params[:keyword]).order('id DESC').page(params[:page]).per(12)
  end
end
