class FavoritesController < ApplicationController
  def create
    @post = Post.find_by(id: params[:post_id])
    if @post == nil
    else
      current_user.favorite(@post)
      if current_user.id != @post.user_id
        Notice.create(sender_id: current_user.id, reciever_id: @post.user.id,
                      content: "#{current_user.name}さんがあなたの投稿を【お気に入り】しました。", 
                      action: "favorite", post_id: @post.id)
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    current_user.unfavorite(@post)
  end
end
