class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @recent_posts = @user.recent_posts
  end
end
