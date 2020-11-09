# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p require_relative './seeds/categories'
p require_relative './seeds/products'
p require_relative './seeds/invoices'
p require_relative './seeds/sales'
p require_relative './seeds/paths'

include FilePaths

# Category.destroy_all
# Product.destroy_all
# Invoice.destroy_all
# Sale.destroy_all
#
# seed_categories
# seed_products
# seed_invoices(invoices_path)
# seed_sales(sales_path)


