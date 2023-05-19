class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:id])
    @comment = Comment.new(author: @user, post_id: params[:post_id], text: params[:text])
    @comment.author = @user
    @comment.post = @post
    @comment.save

    if @comment.save
      redirect_to user_post_path(user_id: @user.id, id: @post.id)
    else
      redirect_to user_post_comments_new_path
    end
  end
end
