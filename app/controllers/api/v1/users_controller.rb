class Api::V1::UsersController < Api::V1::BaseApiController
  before_action :authenticate, except: [:create]
  skip_before_filter :verify_authenticity_token
  before_filter :validate_if_user_exist, only: :create
  before_filter :validate_if_plan_exist, except: [:show]
  before_filter :get_user_by_email, except: [:create]

  def create
    @user = User.new(user_params)
    return bad_request(@user.errors.full_messages.to_sentence) unless @user.save

    Subscription.create(user_id: @user.id, plan_id: @plan.id)
    
    render 'users/show'
  end

  def show
    render 'users/show'
  end
  
  def update_plan
    @user.update_attribute(:plan_id, @plan.id)
    render 'users/show'
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

    def validate_if_user_exist
      return bad_request('This User already exists') if User.find_by(email: params[:email])
    end

    def validate_if_plan_exist
      @plan = Plan.find_by(name: params[:plan_name])
      return bad_request('This plan does not exists') if @plan.nil?
    end
end
