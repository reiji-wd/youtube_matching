class RelationshipsController < ApplicationController

  def create
    @user = User.find_by(id: params[:friend_id])
    friend = current_user.friend(@user)
    notice = Notice.create(sender_id: current_user.id, reciever_id: @user.id, content: "#{current_user.name}さんとフレンドになりました。")
  end

  def destroy
    @user = User.find(params[:friend_id])
  end

end
