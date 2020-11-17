class Api::InvoicesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_with_api_key

  def create
    if invoice_params['data'].nil?
      render json: {
        message: 'No record provided.'
      }
      return
    end

    result = Invoice.insert_all(invoice_params['data'], returning: %w[product_code definition])

    render json: {
      autenthicated: true,
      result: result
    }
  end

  private

  def authenticate_with_api_key
    unless api_key_params['api_key'] == '123456'
      render json: {
        autenthicated: false,
        message: 'Wrong API key.'
      }
      return
    end
  end

  def api_key_params
    params.permit(:api_key)
  end

  def invoice_params
    params.permit(:data => %i[
                invoice_number
                pen_number
                quantity
                tax_kdv
                tax_otv
                definition
                value_date
                invoice_date
                sum
                product_code
                created_at
                updated_at
              ])
  end
end
