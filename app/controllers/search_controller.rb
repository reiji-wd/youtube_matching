class SearchController < ApplicationController
  def index

    youtube = youtube_service
    channel_search_list = youtube.list_searches(:snippet, q: params[:keyword], type: 'channel', max_results: 10)
    @channels = channel_search_list.items

    icon_search_list = []
    subscriber_search_list = []
    @channels.each do |channel|
      icon_search_list << youtube.list_channels(:snippet, id: channel.id.channel_id, max_results: 10).items[0].snippet.thumbnails.high.url
      subscriber_search_list << youtube.list_channels(:statistics, id: channel.id.channel_id, max_results: 10).items[0].statistics.subscriber_count
    end
    @icons = icon_search_list
    @subscribers = subscriber_search_list
    
  end

end
