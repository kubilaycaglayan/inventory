require 'rails_helper'

RSpec.describe 'invoices/index', type: :view do
  before(:each) do
    assign(:invoices, [
             Invoice.create!(
               invoice_number: 2,
               pen_number: 3,
               quantity: 4,
               tax_kdv: '9.99',
               tax_otv: '9.99',
               definition: 'Definition',
               sum: '9.99',
               product: nil
             ),
             Invoice.create!(
               invoice_number: 2,
               pen_number: 3,
               quantity: 4,
               tax_kdv: '9.99',
               tax_otv: '9.99',
               definition: 'Definition',
               sum: '9.99',
               product: nil
             )
           ])
  end

  it 'renders a list of invoices' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: 4.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: 'Definition'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
