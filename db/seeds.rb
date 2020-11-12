# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative './seeds/categories'
require_relative './seeds/products'
require_relative './seeds/invoices'
require_relative './seeds/sales'
require_relative './seeds/paths'

include FilePaths

# Category.destroy_all
# Categorying.destroy_all
# Product.destroy_all
# Invoice.destroy_all
Sale.destroy_all
# Outstanding.destroy_all

# seed_categories
# seed_products
# seed_invoices(INVOICES_PATH)
seed_sales(SALES_PATH)
