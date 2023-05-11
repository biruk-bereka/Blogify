class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    @posts = Post.includes(:comments, :author).where(author: @user)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
end
