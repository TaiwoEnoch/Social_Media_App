class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user
      @posts = @user.recent_posts
      render :show
    else
      render plain: 'User not found', status: :not_found
    end
  end
end
