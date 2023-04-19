class Api::V1::NotesController < Api::V1::BaseApiController
  before_action :authenticate
  skip_before_filter :verify_authenticity_token

  def create
    @note = Note.new(notes_params)
    unless @note.save
      return bad_request(@note.errors.full_messages.to_sentence)
    end
    render 'notes/show'
  end

  private
    def notes_params
      params.permit(:content, :title, :folder_id)
    end
end