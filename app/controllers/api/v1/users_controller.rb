class Api::V1::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @user = User.new(user_params)
    @user.save
    render 'users/show'
  end

  private
    def user_params
      params.permit(:name, :email, :password, :passwor_confirmation)
    end
end
