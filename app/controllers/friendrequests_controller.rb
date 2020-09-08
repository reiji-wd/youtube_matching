class FriendrequestsController < ApplicationController
  before_action :require_user_logged_in

  def show
    @user = User.find(params[:id])
    @friendrequests = Friendrequest.where(friend_id: @user.id).order(id: :desc)
  end

  def create
    @user = User.find(params[:friend_id])
    current_user.friendrequest(@user)
    notice = Notice.create(sender_id: current_user.id, reciever_id: @user.id, content: "#{current_user.name}さんからフレンド申請が届きました。")
  end

  def destroy
    @user = User.find(params[:friend_id])
    current_user.unrequest(@user)
  end
end
