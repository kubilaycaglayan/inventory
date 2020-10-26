json.extract! sale, :id, :date, :product_id, :return_amount, :buy_price, :sell_price, :created_at, :updated_at
json.url sale_url(sale, format: :json)
