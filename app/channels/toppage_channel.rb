class ToppageChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "toppage_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def tweet(data)
    # binding.pry
    Post.create! content: data['post'], user_id: current_user.id
  end
end
