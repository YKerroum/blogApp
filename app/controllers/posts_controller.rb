class PostsController < ApplicationController
  before_action :find_user

  def find_user
    @user = User.find(params[:user_id])
  end

  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:id])
  end
end
