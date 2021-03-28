class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order(id: :desc)
    @favorites = @user.favorites_post
    @youtubers = @user.likes_youtuber
    if @room = Room.find_by(user_id: current_user.id, friend_id: @user.id)
    else
      @room = Room.find_by(user_id: @user.id, friend_id: current_user.id)
    end
    @friends  = (@user.friends + @user.otherfriends)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to @user
    end
  end

  def update
    if current_user.update(update_user_params)
      redirect_to user_url(current_user)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def look
    @youtuber = Youtuber.find_by(channel_id: params[:channel_id])
    users = []
    @youtuber.likes.each do |user|
      users << User.find(user.user_id)
    end
    @users = users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation).merge(user_id: user_id)
  end

  def user_id
    require 'securerandom'
    user_id = SecureRandom.alphanumeric(10)
      while User.find_by(user_id: user_id) != nil do
        user_id = SecureRandom.alphanumeric(10)
      end
    return user_id
  end

  def update_user_params
    params.require(:user).permit(:icon, :name, :content, :password, :password_confirmation)
  end

end
