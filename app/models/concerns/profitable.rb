require_relative './unit_operations/profit_helper'

module Profitable
  extend ActiveSupport::Concern
  include ProfitHelper

  def prof
    buy_price = self.buy_price || 0.0
    comission = payment.comission || 0.0
    sell_price = self.sell_price || 0.0

    calculate_profit(buy_price, comission, sell_price)
  end

  class_methods do
    include ProfitHelper
    def profit(collection)
      buy_price = collection.sum(:buy_price)
      comission = Payment.where(sale_id: [Sale.all.ids]).sum(:comission)
      sell_price = collection.sum(:sell_price)

      result = calculate_profit(buy_price, comission, sell_price)

      result[:gross] = sell_price.to_f.round 2

      result
    end
  end
end
