class LikesController < ApplicationController
  def create
    like = Like.new(author: current_user, post_id: params[:post_id])
    like.save
    redirect_back(fallback_location: root_path) if like.save
  end
end
