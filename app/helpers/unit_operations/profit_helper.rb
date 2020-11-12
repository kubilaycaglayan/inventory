module ProfitHelper
  def calculate_profit(buy_price, comission, sell_price)
    net = (sell_price - comission).to_f.round(2)
    profit = (sell_price - comission - buy_price).to_f.round(2)
    margin = if net.zero?
               0.0
             else
               ((1 - (buy_price / net)) * 100).to_f.round(2)
             end

    {
      net: net,
      profit: profit,
      margin: margin
    }
  end
end
