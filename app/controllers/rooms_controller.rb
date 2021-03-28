class RoomsController < ApplicationController
  
  def index
    @rooms = current_user.has_rooms
  end

  def show
    if @room = Room.find_by(id: params[:id])
      if current_user != @room.user && current_user != @room.friend
        redirect_to root_path
      end
      if current_user.id != @room.user_id 
        @user = User.find_by(id: @room.user_id)
      else
        @user = User.find_by(id: @room.friend_id)
      end
      new_messages = Message.where(room_id: @room.id, check: nil).where.not(user_id: current_user.id)
      new_messages.update(check: "check")
      @messages = @room.messages
    else
      redirect_to root_path
    end

  end

  def create
  end
end
