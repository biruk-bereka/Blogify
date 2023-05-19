class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  def index
    @user = User.find_by(id: params[:id])
    @posts = Post.includes(:comments, :author).where(author: @user)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.author_id
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.save
    puts post.errors.full_messages
    if post.save
      flash[:success] = 'Post created successfully'
      redirect_to user_posts_path(current_user)
    else
      flash[:error] = 'Post not created'
      redirect_to user_posts_new_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = User.find(params[:user_id])
    post.destroy
    flash[:notice] = 'Post has been deleted!'
    user.decrement!(:posts_counter)
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge(author_id: current_user.id)
  end
end
