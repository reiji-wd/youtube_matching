class NoticesController < ApplicationController
  def show
    @notices = Notice.where(reciever_id: current_user.id)
    @notices.update(check: current_user.id)
  end
end
