module ProfitHelper
  def calculate_profit(buy_price = 0, comission = 0, sell_price = 0)
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
