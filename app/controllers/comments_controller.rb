class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.author = @user
    @comment.post = @post

    if @comment.save
      redirect_to user_post_path(user_id: @user.id, id: @post.id)
    else
      redirect_to user_post_comments_new_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
