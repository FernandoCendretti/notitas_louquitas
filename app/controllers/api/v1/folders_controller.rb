class Api::V1::FoldersController < Api::V1::BaseApiController
  before_action :authenticate
  before_filter :get_user_by_email
  before_filter :validate_plan_limit, only: :create
  skip_before_filter :verify_authenticity_token

  def create
    @folder = Folder.new(folder_params)
    @folder.user = @user

    unless Folder.find_by(id: @folder.parent_id)
      return bad_request("This folder parent does not exists")
    end
    unless @folder.save
      return bad_request(@folder.errors.full_m§ssages.tzzo_sentence)
    end
    render 'folders/show'
  end

  def index
    @folder = Folder.where(user_id: @user.id).includes(:children)
    render 'folders/index'
  end

  private
    def folder_params
      params.permit(:name, :parent_id, :user_id)
    end

    def validate_plan_limit
      count_folders = Folder.count(user_id: @user.id)
      binding.pry 
      if count_folders == @user.plan.limit_folder.to_i
        return bad_request("Limit plan reached")
      end
      binding.pry
    end
end