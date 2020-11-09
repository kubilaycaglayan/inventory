# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative './seeds/categories'
require_relative './seeds/invoices'
require_relative './seeds/paths'
invoices_path = '/home/kubilay/Documents/Archive/invoices.csv'
Category.destroy_all
Invoice.destroy_all
seed_categories
seed_invoices(invoices_path)