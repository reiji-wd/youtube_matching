class PostBroadcastJob < ApplicationJob
  queue_as :default

  def perform(post)
    users = []
    friends = post.user.friends + post.user.otherfriends
    friends.each do |friend|
      users << friend
    end
    
    mine = ApplicationController.render(
      partial: "posts/mine",
      locals: { post: post, current_user: post.user })
      
      UserChannel.broadcast_to(post.user,  mine: mine, post: post)
      
      users.each do |user|
      theirs = ApplicationController.render(
        partial: "posts/theirs",
        locals: { post: post, current_user: user })
      UserChannel.broadcast_to(user, theirs: theirs, post: post)
    end

  end

end
