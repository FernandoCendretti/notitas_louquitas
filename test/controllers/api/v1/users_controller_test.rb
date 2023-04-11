require 'test_helper'
class Api::V1::UsersControllerTest < ActionController::TestCase
  def setup
    @user = Fabricate(:user)
  end
  test 'should be able to create a new user' do
    post :create, name: 'John', email: 'john@email.com', password: '123', password_confirmation: '123', plan_id: 1
    assert_response :success
    User.find()
  end
end
