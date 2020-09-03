class PostBroadcastJob < ApplicationJob
  queue_as :default

  def perform(post)
    mine = ApplicationController.render(
      partial: 'posts/mine',
      locals: { post: post }
    )

    theirs = ApplicationController.render(
      partial: 'posts/theirs',
      locals: { post: post }
    )

    ActionCable.server.broadcast 'toppage_channel', mine: mine, theirs: theirs, post: post
  end

end
