require 'test_helper'
class Api::V1::UsersControllerTest < ActionController::TestCase
  def setup
    @user = Fabricate(:user)
    @plan = Fabricate(:plan)
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  test 'should be able to create a new user' do
    body = {
      name: 'Fernando',
      email: 'fernando@email.com',
      password: '123',
      password_confirmation: '123',
      plan_name: 'Basic'
    }
    post :create, body
    assert_response :success
    @json = JSON.parse(response.body)
    binding.pry
    assert_equal @json['name'], 'Fernando'
    assert_equal @json['email'], 'fernando@email.com'
    assert_not_empty @json['plan']['name'] = Basic
    assert_not_empty @json['id']
  end

  test 'should be able to return a error if name is empty' do
    body = {
      email: 'fernando@email.com',
      password: '123',
      password_confirmation: '123',
      plan_name: 'Basic'
    }
    post :create, body
    assert_response :bad_request
    @json = JSON.parse(response.body)
    assert_equal @json['errors'], "Name can't be blank"
  end
  test 'should be able to return a error if email is empty' do
    body = {
      name: 'Fernando',
      password: '123',
      password_confirmation: '123'
    }
    post :create, body
    assert_response :bad_request
    @json = JSON.parse(response.body)
    assert_equal @json['errors'], "Email can't be blank and Email must be a valid email address"
  end
  test 'should be able to return a error if password is empty' do
    body = {
      name: 'Fernando',
      email: 'fernando@email.com',
      plan_name: 'Basic'
    }
    post :create, body
    assert_response :bad_request
    @json = JSON.parse(response.body)
    assert_equal @json['errors'], "Password can't be blank"
  end
  test 'should be able to return a error if email is a invalid email' do
    body = {
      name: 'Fernando',
      email: 'fernando',
      password: '123',
      password_confirmation: '123',
      plan_name: 'Basic'
    }
    post :create, body
    assert_response :bad_request
    @json = JSON.parse(response.body)
    assert_equal @json['errors'], "Email must be a valid email address"
  end
  test 'should be able to return a error if user already exists' do
    body = {
      name: 'John',
      email: 'doe@email.com',
      password: '123',
      password_confirmation: '123',
      plan_name: 'Basic'
    }
    post :create, body
    assert_response :bad_request
    @json = JSON.parse(response.body)
    assert_equal @json['errors'], 'This User already exists'
  end
end
