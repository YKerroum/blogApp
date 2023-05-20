class PostsController < ApplicationController
  before_action :find_user

  def find_user
    @user = User.find(params[:user_id])
  end

  def index
    @posts = @user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      flash[:notice] = 'Post created successfully!'
      redirect_to user_posts_path(current_user)
    else
      flash[:alert] = "Couldn't create new post!"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = @user.posts.find(params[:id])
    @like = Like.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
