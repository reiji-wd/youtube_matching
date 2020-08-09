class PostBroadcastJob < ApplicationJob
  queue_as :default

  def perform(post)
    ActionCable.server.broadcast 'toppage_channel', post: render_post(post)
  end

  private

  def render_post(post)
    ApplicationController.renderer.render partial: 'posts/post', locals: { post: post, current_user: post.user } 
  end
end
