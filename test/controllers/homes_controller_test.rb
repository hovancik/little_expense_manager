require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get homes_url
    assert_response :success
  end

end
