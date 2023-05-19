class Api::V0::PostsController < Api::V0::BaseController
    skip_before_action :authenticate, only: :index
  
    def index
      user = User.find(params[:user_id])
      @posts = Post.where(author: user)
  
      render json: @posts
    end
end
