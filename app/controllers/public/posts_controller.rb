class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # 投稿ボタンを押した場合
    if params[:go]
      if @post.save(context: :publicize)
        redirect_to post_path(@post.id)
      else
        render :new
      end
    # 下書きボタンを押した場合
    else
      if @post.update(is_draft: true)
        redirect_to post_path(@post.id)
      else
        render :new
      end
    end
  end

  def index
    # 投稿したものだけを表示
    @posts = Post.where(is_draft: :false).page(params[:page]).per(12)
  end

  def my_index
    # 下書きも含めて全て表示
    @posts = current_user.posts.page(params[:page]).per(12)
  end

  def show
    @post = Post.find(params[:id])
  end

  def detail
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    # 下書きから投稿へ
    if params[:go_draft]
      @post.attributes = post_params.merge(is_draft: false)
      if @post.save(context: :publicize)
        redirect_to post_path(@post.id)
      else
        @post.is_draft = true
        render :edit
      end
    # 投稿を更新
    elsif params[:update_post]
      @post.attributes = post_params
      if @post.save(context: :publicize)
        redirect_to post_path(@post.id)
      else
        render :edit
      end
    # 下書きを更新
    else
      if @post.update(post_params)
        redirect_to post_path(@post.id)
      else
        render :edit
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/my_posts'
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :body, :rate, :postal_code, :address, :is_draft, :user_id, :tag_id, :name)
  end
end
