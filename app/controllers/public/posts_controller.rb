class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :body, :rate, :postal_code, :address)
  end
end
