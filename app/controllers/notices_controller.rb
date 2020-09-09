class NoticesController < ApplicationController
  def index
    @notices = Notice.where(reciever_id: current_user.id).order(id: :desc)
    @notices.update(check: "check")
  end

  def destroy
    @notices = Notice.where(reciever_id: params[:id])
    @notices.destroy_all
    redirect_to notices_url
  end
end
