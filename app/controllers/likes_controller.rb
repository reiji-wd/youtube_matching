class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    @youtuber = Youtuber.find(params[:youtuber_id])
    current_user.like(@youtuber)
  end

  def destroy
    @youtuber = Youtuber.find(params[:youtuber_id])
    current_user.unlike(@youtuber)
  end
  
end
