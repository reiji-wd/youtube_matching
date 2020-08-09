module YoutubesHelper

  require 'google/apis/youtube_v3'
  API_KEY = ENV['YOUTUBE_DATA_API_KEY']

  private

  def youtube_service

    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = API_KEY

    return youtube

  end

end
