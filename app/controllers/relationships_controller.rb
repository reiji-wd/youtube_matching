class RelationshipsController < ApplicationController

  def create
    @user = User.find_by(id: params[:friend_id])
    relationship = current_user.friend(@user)
    notice = Notice.create(sender_id: current_user.id, reciever_id: @user.id, content: "#{current_user.name}さんとフレンドになりました。")
    request = Friendrequest.find_by(user_id: @user.id, friend_id: current_user.id)
    @request_id = request.id
    request.destroy
    # Room.create(user_id: relationship.user_id, friend_id: relationship.friend_id)
  end

  def destroy
    relationship = Relationship.find(params[:id])
    if current_user == relationship.user 
      @user = relationship.friend
    end
    if current_user == relationship.friend
      @user = relationship.user
    end
    relationship.destroy
  end

end
