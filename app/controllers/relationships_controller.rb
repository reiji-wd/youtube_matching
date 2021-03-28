class RelationshipsController < ApplicationController

  def create
    # binding.pry
    @user = User.find_by(id: params[:friend_id])
    request = Friendrequest.find_by(user_id: @user.id, friend_id: current_user.id)

      @request_id = request.id
      request.destroy
      relationship = current_user.friend(@user)
      Notice.create(sender_id: current_user.id, reciever_id: @user.id,
                            content: "#{current_user.name}さんとフレンドになりました。", 
                            action: "friend")
      Room.create(user_id: relationship.user_id, friend_id: relationship.friend_id, relationship_id: relationship.id)
  end

  def destroy
    relationship = Relationship.find_by(id: params[:id])
    if relationship == nil
      user = User.find_by(id: params[:user_id])
      redirect_to user_path(user)
    else
      if current_user == relationship.user
        @user = relationship.friend
      end
      if current_user == relationship.friend
        @user = relationship.user
      end
      room = Room.find_by(relationship_id: relationship.id)
      room.destroy
      relationship.destroy
    end
  end

end
