class FriendrequestsController < ApplicationController
  before_action :require_user_logged_in

  def index
    @friendrequests = Friendrequest.where(friend_id: current_user.id).order(id: :desc)
  end

  def show
  end

  def create
    @user = User.find(params[:friend_id])
    request = current_user.friendrequest(@user)
    notice = Notice.create(sender_id: current_user.id, reciever_id: @user.id,
                          content: "#{current_user.name}さんからフレンド申請が届きました。", 
                          action: "request", request_id: request.id)
  end

  def destroy
    @user = User.find(params[:friend_id])
    current_user.unrequest(@user)
  end
end
