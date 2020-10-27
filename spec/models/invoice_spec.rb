require 'rails_helper'

RSpec.describe Invoice, type: :model do
  let(:invoice_number) { 0001 }
  let(:pen_number) { 010 }
  let(:quantity) { 1 }
  let(:tax_kdv) { 18.0 }
  let(:tax_otv) { 15.5 }
  let(:definition) { 'Refrigerator' }
  let(:value_date) { '2025-02-15' }
  let(:sum) { 1550.50 }
  let(:product_code) { 'WAT24480TR' }

  let(:invoice1) { Invoice.new(
    invoice_number: invoice_number,
    pen_number: pen_number,
    quantity: quantity,
    tax_kdv: tax_kdv,
    tax_otv: tax_otv,
    definition: definition,
    value_date: value_date,
    sum: sum,
    product_code: product_code
  )}


end
