class NoticeBroadcastJob < ApplicationJob

  def perform(notice)
    html = ApplicationController.render(partial: 'notices/notice', locals: { notice: notice })
    UserChannel.broadcast_to(notice.reciever, notice: html)
  end
  

end
