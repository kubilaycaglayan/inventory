json.extract! invoice, :id, :invoice_number, :pen_number, :quantity, :tax_kdv, :tax_otv, :definition, :value_date, :sum, :product_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
