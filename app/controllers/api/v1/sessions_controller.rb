class Api::V1::SessionsController < Api::V1::BaseApiController
  skip_before_filter :verify_authenticity_token

  def create
    user = User.find_by_email(params[:email])
    token = JWT.encode({ user_id: user.id }, ENV['JWT_SECRET'], 'HS256')
    render json: { token: token }
  end
end
