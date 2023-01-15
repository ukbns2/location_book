class Admin::SearchesController < ApplicationController
  def search
    @posts = Post.looks(params[:search], params[:keyword])
  end
end
