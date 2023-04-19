class Api::V1::FoldersController < Api::V1::BaseApiController
  before_action :authenticate
  before_filter :get_user_by_email
  before_filter :validate_plan_limit, only: :create
  skip_before_filter :verify_authenticity_token

  def create
    @folder = @user.folders.new(folder_params)

    return bad_request("This folder parent does not exists") if is_valid_parent_id

    return bad_request(@folder.errors.full_messages.to_sentence) unless @folder.save

    render 'folders/show'
  end

  def index
    @folders = @user.folders
    render 'folders/index'
  end

  private
    def folder_params
      params.permit(:name, :parent_id)
    end

    def validate_plan_limit
      return bad_request("Limit plan reached") if is_count_folder_grather_than_limit_folder?
    end

    def is_valid_parent_id
      @folder.parent_id && !Folder.find_by(id: @folder.parent_id)
    end

    def is_count_folder_grather_than_limit_folder?
      @user.folders.count() >= @user.plan.limit_folder.to_i
    end
end