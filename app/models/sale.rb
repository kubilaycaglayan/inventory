class Sale < ApplicationRecord
  after_create :add_payment_record
  include Profitable

  belongs_to :product

  has_one :payment

  def profit
    result = prof

    result[:code] = product.code
    result
  end

  private

  def add_payment_record
    Payment.create(sale_id: id)
  end
end
