require 'rails_helper'

RSpec.describe 'invoices/show', type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
                                  invoice_number: 2,
                                  pen_number: 3,
                                  quantity: 4,
                                  tax_kdv: '9.99',
                                  tax_otv: '9.99',
                                  definition: 'Definition',
                                  sum: '9.99',
                                  product: nil
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Definition/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
