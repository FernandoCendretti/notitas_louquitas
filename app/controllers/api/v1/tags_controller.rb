class Api::V1::TagsController < Api::V1::BaseApiController
  before_action :authenticate
  skip_before_filter :verify_authenticity_token

  def create
    @tag = Tag.create(name: params[:name])
    return bad_request(@tag.errors.full_messages.to_sentence) if @tag.errors.any?

    tagging_reesource
    return bad_request(tagging.errors.full_messages.to_sentence) if @tagging.errors.any?

    render 'tags/show'
  end

  private
    def tagging_reesource
      @tagging = Tagging.create(tag_id: @tag.id, resource_id: params[:resource_id], resource_type:params[:resource_type])
    end
end
