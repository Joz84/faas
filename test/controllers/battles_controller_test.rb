require 'test_helper'

class BattlesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get battles_create_url
    assert_response :success
  end

end
