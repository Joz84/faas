require 'test_helper'

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get activities_create_url
    assert_response :success
  end

end
