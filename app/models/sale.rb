class Sale < ApplicationRecord
  include Profitable

  belongs_to :product

  has_one :payment

  def profit
    result = prof

    result[:code] = product.code
    result
  end
end
