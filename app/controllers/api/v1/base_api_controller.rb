class Api::V1::BaseApiController < ApplicationController
  def bad_request(errors)
    @errors = errors
    render 'errors/400', status: :bad_request
  end

  def unauthorized(errors)
    @errors = errors
    render 'errors/401', status: :unauthorized
  end

  def authenticate
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      decoded_token = JWT.decode(token, ENV['JWT_SECRET'], true, algoritm: 'HS256')
      @current_user_email = decoded_token[0]['user_email']
    rescue ActiveRecord::RecordNotFound
      return unauthorized('User is not logged')
    rescue JWT::DecodeError
      return unauthorized('User is not logged')
    end
  end

  def get_user_by_email
    @user = User.find_by(email: @current_user_email)
    return bad_request('This user does not exists') if @user.nil?
  end
end
