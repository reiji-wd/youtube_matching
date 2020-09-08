class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(message_params)
    @room = Room.find(@message.room_id)
    @room.update(updated_at: @message.created_at)
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(room_id: params[:room_id])
  end
end
