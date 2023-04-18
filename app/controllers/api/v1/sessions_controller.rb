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
      return bad_request("Using a wrong password/email") unless is_user_authenticated 
    end

    def is_user_authenticated
      @user && @user.authenticate(params[:password])
    end
end
