class MessageBroadcastJob < ApplicationJob

  def perform(message)
    mine = ApplicationController.render(
      partial: 'messages/mine',
      locals: { message: message }
    )
    
    theirs = ApplicationController.render(
      partial: 'messages/theirs',
      locals: { message: message }
    )

    ActionCable.server.broadcast "room_channel_#{message.room_id}", mine: mine, theirs: theirs, message: message
    room = Room.find(message.room_id)
    user = User.find(room.user.id)
    friend = User.find(room.friend.id)
    if user == message.user 
      html = ApplicationController.render(
      partial: 'rooms/room',
      locals: {room: room, current_user: friend }
      )
      UserChannel.broadcast_to(friend, message: message, html: html)
    else
      html = ApplicationController.render(
      partial: 'rooms/room',
      locals: {room: room, current_user: user }
      )
      UserChannel.broadcast_to(user, message: message, html: html)
    end
    
  end

end
