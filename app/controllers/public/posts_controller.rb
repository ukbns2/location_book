class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_name].split(', ')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page]).per(12)
    @tag_list = Tag.all
  end

  def my_index
    @posts = current_user.posts.page(params[:page]).per(12)
  end

  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(', ')
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:tag_name].split(', ')
    if @post.update(post_params)
      # このpost_idに紐づいてタグを@oldに入れる
      @old_relations = PostTag.where(post_id: @post.id)
      # それらを取り出し、消す。消し終わる。
      @old_relations.each do |relation|
        relation.delete
      end
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/posts'
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :body, :rate, :postal_code, :address)
  end
end
