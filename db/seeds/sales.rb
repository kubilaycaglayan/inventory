require 'csv'

def product_ids_and_codes
  @ids_and_codes || @ids_and_codes = Product.pluck(:id, :code)
end

def seed_sales(csv_file_path)
  puts "Seeding sales from #{csv_file_path}..."

  f = File.new(csv_file_path, 'r')
  csv = CSV.new(f)

  headers = csv.shift

  csv.each do |row|
    information = {
      date: row[1] === 'NULL' ? nil : row[1],
      product_id: row[4] === 'NULL' ? nil : product_ids_and_codes
        .select { |pair| pair.last == row[4] }[0][0],
      buy_price: row[5] === 'NULL' ? 0 : row[5],
      return_amount: row[6] === 'NULL' ? nil : row[6],
      sell_price: row[7] === 'NULL' ? 0 : row[7]
    }

    sale = Sale.create!(information)

    if row[8] == 'NULL'
      kind = 'Kart' unless row[11] == 'NULL'
    else
      kind = row[8]
    end

    payment_information = {
      sale_id: sale.id,
      kind: 'Nakit',
      bank: row[10] === 'NULL' ? nil : row[10],
      comission: row[11] === 'NULL' ? nil : row[11],
    }

    Payment.create(payment_information)
  end

  puts "Seeding sales from #{csv_file_path} done."
end