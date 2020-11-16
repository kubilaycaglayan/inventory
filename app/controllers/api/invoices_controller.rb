class Api::InvoicesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_with_api_key

  def create
    render json: {
      autenthicated: true
    }
  end

  private

  def authenticate_with_api_key
    unless params[:api_key] == 'api_key'
      render json: {
        autenthicated: false,
        message: 'Wrong API key.'
      }
    end
  end
end
