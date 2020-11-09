require 'csv'
require_relative 'paths'

f = File.new(sales_path, 'r')
csv = CSV.new(f)

csv.each do |row|
  row_array = row.split(',')
end