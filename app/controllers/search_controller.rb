class SearchController < ApplicationController
  def index
    @posts = Post.where('content LIKE ?', "%#{params[:keyword]}%")  
    @users = User.where('name LIKE ?', "%#{params[:keyword]}%")
  end

end
