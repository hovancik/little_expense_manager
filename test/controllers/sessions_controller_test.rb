require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_session_path
    assert_response :success
    assert_select "h3", "Login"
  end

  test "should show error with bad param" do
    post sessions_path,
      params: { session: {email: "", password: ""} }
    assert_response :unprocessable_entity
    assert_equal '{"errors":"Bad email or password."}', @response.body
    assert_equal 'application/json', @response.content_type
  end

end
