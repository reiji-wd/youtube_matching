class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def show
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = current_user.posts.create(post_params)
  end

  def destroy
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end

end
