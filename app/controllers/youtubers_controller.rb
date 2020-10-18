class YoutubersController < ApplicationController

  def search
    youtuber = youtuber_search
    channels = youtuber[0]
    icons = youtuber[1]
    subscribers = youtuber[2]
    i = 0
    youtuber_list = []
    while i < channels.size do
      if channel = Youtuber.find_by(channel_id: channels[i].id.channel_id)
        channel.update(title: channels[i].snippet.channel_title, icon: icons[i], subscribers: subscribers[i])
        youtuber_list << channel
        i += 1
      else
        youtuber_list << Youtuber.create(channel_id: channels[i].id.channel_id, title: channels[i].snippet.channel_title, icon: icons[i], subscribers: subscribers[i])
        i += 1
      end
    end
 
    @youtubers = youtuber_list  
  end

  def form
  end
end
