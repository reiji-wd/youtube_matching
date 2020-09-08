class UserChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def messagecheck(data)
    data_message = data["message"]
    message = Message.find(data_message["id"])
    message.update(check: "check")
  end

  def noticecheck(data)
    data_notice = data["notice"]
    notice = Notice.find(data_notice["id"])
    notice.update(check: "check")
  end

end
