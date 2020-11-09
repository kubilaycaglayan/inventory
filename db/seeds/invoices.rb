require 'csv'

def seed_invoices(csv_file_path)
  puts "Seeding invoices from #{csv_file_path}..."

  f = File.new(csv_file_path, 'r')
  csv = CSV.new(f)

  headers = csv.shift

  csv.each do |row|
    information = {
      invoice_date: row[0] === 'NULL' ? nil : row[0],
      invoice_number: row[1] === 'NULL' ? nil : row[1],
      product_code: row[2] === 'NULL' ? nil : row[2],
      quantity: row[3] === 'NULL' ? nil : row[3],
      sum: row[4] === 'NULL' ? nil : row[4],
      tax_kdv: row[5] === 'NULL' ? nil : row[5],
      tax_otv: row[6] === 'NULL' ? nil : row[6],
      definition: row[7] === 'NULL' ? nil : row[7],
      value_date: row[8] === 'NULL' ? nil : row[8],
      pen_number: row[9] === 'NULL' ? nil : row[9]
    }

    inv = Invoice.create(information)
  end

  puts "Seeding invoices from #{csv_file_path} done."
end