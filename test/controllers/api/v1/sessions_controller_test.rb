require 'test_helper'

class Api::V1::SessionsControllerTest < ActionController::TestCase
  def setup
    @user = Fabricate(:user)
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  test 'should be able to create a session to user' do
    body = {
      email: 'doe@email.com',
      password: '123'
    }
    post :create, body
    assert_response :success
    @json = JSON.parse(response.body)
    assert_not_nil @json['token']
  end
  test 'should be able to return a error if user does not exists' do
    body = {
      email: 'fernando@email.com',
      password: '123'
    }
    post :create, body
    assert_response :bad_request
    @json = JSON.parse(response.body)
    assert_equal @json['errors'], 'Using a wrong password/email'
  end
  test 'should be able to return a error if user using a wrong password' do
    body = {
      email: 'doe@email.com',
      password: '1234'
    }
    post :create, body
    assert_response :bad_request
    @json = JSON.parse(response.body)
    assert_equal @json['errors'], 'Using a wrong password/email'
  end
end
