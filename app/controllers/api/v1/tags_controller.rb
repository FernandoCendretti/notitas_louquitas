class Api::V1::TagsController < Api::V1::BaseApiController
  before_action :authenticate
  before_filter :validate_if_tags_exists, only: :create
  skip_before_filter :verify_authenticity_token

  def create
    @tag = Tag.create(name: params[:name])
    return bad_request(@tag.errors.full_messages.to_sentence) if @tag.errors.any?

    tagging_resource

    render 'tags/show'
  end

  private
    def validate_if_tags_exists
      @tag = Tag.find_by(name: params[:name])

      unless @tag.nil?
        tagging_resource
        render 'tags/show'
      end
    end

    def tagging_resource
      @tagging = Tagging.create(tag_id: @tag.id, resource_id: params[:resource_id], resource_type:params[:resource_type])
      return bad_request(tagging.errors.full_messages.to_sentence) if @tagging.errors.any?
    end
end
