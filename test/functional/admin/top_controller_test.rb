require 'test_helper'

class Admin::TopControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "index for a commmon member" do
    login_as("taro")
    #assert_raise(ApplicationController::Forbidden) { get :index }
    get :index
    assert_response 403
  end

  test "index for an admin" do
    login_as("jiro", "true")
    get :index
    assert_response :success
  end
end
