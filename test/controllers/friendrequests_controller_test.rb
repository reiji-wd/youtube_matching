require 'test_helper'

class FriendrequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get friendrequests_create_url
    assert_response :success
  end

  test "should get destroy" do
    get friendrequests_destroy_url
    assert_response :success
  end

end
