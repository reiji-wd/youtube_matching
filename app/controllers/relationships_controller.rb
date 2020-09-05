class RelationshipsController < ApplicationController

  def create
    @user = User.find_by(id: params[:friend_id])
    relationship = current_user.friend(@user)
    notice = Notice.create(sender_id: current_user.id, reciever_id: @user.id, content: "#{current_user.name}さんとフレンドになりました。")
    Room.create(user_id: relationship.user_id, friend_id: relationship.friend_id)
  end

  def destroy
    @user = User.find(params[:friend_id])
  end

end
