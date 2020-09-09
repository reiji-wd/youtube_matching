class MessagesController < ApplicationController
  def create
    @room = Room.find_by(id: params[:room_id])
    if @room == nil
      # エラーメッセージを表示させてルームの一覧ページに移動
      redirect_to rooms_url
    else
      @message = current_user.messages.create(message_params)
      @room.update(updated_at: @message.created_at)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(room_id: params[:room_id])
  end
end
