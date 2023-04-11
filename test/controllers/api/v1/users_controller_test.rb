require 'test_helper'
class Api::V1::UsersControllerTest < ActionController::TestCase
  def setup
    @user = Fabricate(:user)
    @plan = Fabricate(:plan)
  end

  test 'should be able to create a new user' do
    body = {
      name: 'Fernando',
      email: 'fernando@email.com',
      password: '123',
      password_confirmation: '123'
    }
    post :create, body
    assert_response :success
    @json = JSON.parse(response.body)
    assert_equal @json['name'], 'Fernando'
    assert_equal @json['email'], 'fernando@email.com'
    assert_not_empty @json['id']
  end
end
