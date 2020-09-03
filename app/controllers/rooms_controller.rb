class RoomsController < ApplicationController
  def index
  end

  def show
    @room = Room.find(params[:id])
    if current_user.id != @room.user_id 
      @user = User.find_by(id: @room.user_id)
    else
      @user = User.find_by(id: @room.friend_id)
    end
    @messages = @room.messages
  end

  def create
  end
end
