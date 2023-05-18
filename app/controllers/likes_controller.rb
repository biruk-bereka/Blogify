class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    like = Like.new(author: current_user, post_id: params[:post_id])
    like.save
    redirect_to user_post_path if like.save
  end
end
