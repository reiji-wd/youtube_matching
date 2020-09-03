class FriendRequestBroadcastJob < ApplicationJob

  def perform(request)
    # binding.pry
    html = ApplicationController.render(partial: 'friendrequests/friendrequest', locals: { friendrequest: request, current_user: request.friend })
    UserChannel.broadcast_to(request.friend, request: html)
  end

end
