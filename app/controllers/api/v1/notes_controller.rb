class Api::V1::NotesController < Api::V1::BaseApiController
  before_action :authenticate
  skip_before_filter :verify_authenticity_token

  def create
    
  end
end