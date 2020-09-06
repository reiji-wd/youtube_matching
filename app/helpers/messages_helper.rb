module MessagesHelper
  def new_message_count(room, current_user)
    room = Room.find(room.id)
    message_count = Message.where(room_id: room.id, check: nil).where.not(user_id: current_user.id).count
    if message_count != 0
      content_tag(:div, message_count, class: "new-message-count-#{room.id}")
    end
  end
end
