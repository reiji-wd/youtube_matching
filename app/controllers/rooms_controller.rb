class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms + current_user.reverses_of_rooms
    @rooms.sort! do |a, b|
      b[:updated_at] <=> a[:updated_at]
    end
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
