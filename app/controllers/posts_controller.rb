class PostsController < ApplicationController
  def index
    @posts = Post.all
    author_id = params[:author_id]
    @posts = @posts.where(author_id: author_id) if author_id.present?
    @user = User.find_by(id: params[:user_id])
    @comments = @posts.map(&:recent_comments)
    render :index
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
    @comments = @post.recent_comments if @post
    if @post
      render :show
    else
      redirect_to posts_url
    end
  end
end
