require 'test_helper'

class DynamicControllerTest < ActionDispatch::IntegrationTest
  test "should get gossip" do
    get dynamic_gossip_url
    assert_response :success
  end

  test "should get user" do
    get dynamic_user_url
    assert_response :success
  end

  test "should get welcome" do
    get dynamic_welcome_url
    assert_response :success
  end

end
