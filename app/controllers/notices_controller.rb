class NoticesController < ApplicationController
  def show
    @notices = Notice.where(reciever_id: current_user.id)
    @notices.update(check: current_user.id)
  end

  def destroy
    @notices = Notice.where(reciever_id: params[:id])
    @notices.destroy_all
    redirect_to notice_url(current_user)
  end
end
