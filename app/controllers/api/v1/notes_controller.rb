class Api::V1::NotesController < Api::V1::BaseApiController
  before_action :authenticate
  before_filter :get_note_by_id, only: [:show, :update]
  skip_before_filter :verify_authenticity_token

  def create
    @note = Note.new(notes_params)
    return bad_request('This folder does not exists') if folder_does_not_exists
    return bad_request(@note.errors.full_messages.to_sentence) unless @note.save
    render 'notes/show'
  end

  def show
    render 'notes/show'
  end

  def update
    @note.title = params[:title]
    @note.content = params[:content]

    return bad_request('This folder does not exists') if folder_does_not_exists

    render 'notes/show'
  end

  private
    def notes_params
      params.permit(:content, :title, :folder_id)
    end

    def folder_does_not_exists
      Folder.find_by(id: @note.folder_id).nil?
    end

    def get_note_by_id
      @note = Note.find_by(id: params[:id])

      return bad_request('This note does not exists') if @note.nil?
    end
end