module YoutubesHelper

  require 'google/apis/youtube_v3'
  API_KEY = ENV['YOUTUBE_DATA_API_KEY']

  def youtuber_search
    youtube = youtube_service
    channel_search_list = youtube.list_searches(:snippet, q: params[:channel_name], type: 'channel', max_results: 10)
    channels = channel_search_list.items

    icon_search_list = []
    subscriber_search_list = []
    channels.each do |channel|
      icon_search_list << youtube.list_channels(:snippet, id: channel.id.channel_id, max_results: 10).items[0].snippet.thumbnails.high.url
      subscriber_search_list << youtube.list_channels(:statistics, id: channel.id.channel_id, max_results: 10).items[0].statistics.subscriber_count
    end
    icons = icon_search_list
    subscribers = subscriber_search_list

    return channels, icons, subscribers
  end

  private

  def youtube_service

    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = API_KEY

    return youtube

  end

end
