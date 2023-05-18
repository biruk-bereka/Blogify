class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
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
    post = Post.new(author: current_user, text: params[:post][:text], title: params[:post][:title],
                    comments_counter: 0, likes_counter: 0)
    post.save
    if post.save
      flash[:success] = 'Post created successfully'
      redirect_to user_posts_path(current_user)
    else
      flash[:error] = 'Post not created'
      redirect_to user_posts_new_path
    end
  end
end
