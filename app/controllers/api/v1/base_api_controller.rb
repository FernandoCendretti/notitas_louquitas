class Api::V1::BaseApiController < ApplicationController
  def bad_request(errors)
    @errors = errors
    render 'errors/400', status: :bad_request
  end
end
