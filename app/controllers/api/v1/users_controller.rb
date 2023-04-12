class Api::V1::UsersController < Api::V1::BaseApiController
  skip_before_filter :verify_authenticity_token
  before_filter :validate_if_user_exist, only: :create

  def create
    @user = User.new(user_params)
    unless @user.save
      return bad_request(@user.errors.full_messages.to_sentence)
    end
    render 'users/show'
  end

  private
    def user_params
      params.permit(:name, :email, :password, :passwor_confirmation)
    end
    def validate_if_user_exist
      if User.find_by(email: params[:email])
        return bad_request('This User already exists')
      end
    end
end
