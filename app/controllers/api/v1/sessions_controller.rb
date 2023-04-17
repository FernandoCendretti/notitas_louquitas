class Api::V1::SessionsController < Api::V1::BaseApiController
  skip_before_filter :verify_authenticity_token
  before_filter :validate_user

  def create
    token = JWT.encode({ user_email: @user.email }, ENV['JWT_SECRET'], 'HS256')
    render json: { token: token }
  end

  private 
    def validate_user
      @user = User.find_by_email(params[:email])
      unless @user && @user.authenticate(params[:password])
        return bad_request("Using a wrong password/email")
      end
    end
end
