class SearchController < ApplicationController
  def index
    youtuber = youtuber_search
    channels = youtuber[0]
    icons = youtuber[1]
    subscribers = youtuber[2]
    i = 0
    youtuber_list = []
    while i < 10 do 
      youtuber_list << Youtuber.find_or_create_by(channel_id: channels[i].id.channel_id, title: channels[i].snippet.channel_title, icon: icons[i], subscribers: subscribers[i])
      i += 1
    end 
    @youtubers = youtuber_list  

    @posts = Post.where('content LIKE ?', "%#{params[:keyword]}%")
    
    @users = User.where('name LIKE ?', "%#{params[:keyword]}%")
  end

end
