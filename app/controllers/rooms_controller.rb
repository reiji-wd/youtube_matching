class RoomsController < ApplicationController
  def index
    @rooms = current_user.has_rooms
  end

  def show
    @room = Room.find(params[:id])
    if current_user.id != @room.user_id 
      @user = User.find_by(id: @room.user_id)
    else
      @user = User.find_by(id: @room.friend_id)
    end
    new_messages = Message.where(room_id: @room.id, check: nil).where.not(user_id: current_user.id)
    new_messages.update(check: "check")
    @messages = @room.messages
  end

  def create
  end
end
