require 'test_helper'

class YoutubersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get youtubers_create_url
    assert_response :success
  end

end
