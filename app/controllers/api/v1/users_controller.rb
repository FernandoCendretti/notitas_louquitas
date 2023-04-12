class Api::V1::UsersController < Api::V1::BaseApiController
  skip_before_filter :verify_authenticity_token

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
end