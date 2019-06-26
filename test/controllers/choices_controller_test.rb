require 'test_helper'

class ChoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get choices_update_url
    assert_response :success
  end

end
