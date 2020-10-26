require 'rails_helper'

RSpec.describe "invoices/edit", type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      invoice_number: 1,
      pen_number: 1,
      quantity: 1,
      tax_kdv: "9.99",
      tax_otv: "9.99",
      definition: "MyString",
      sum: "9.99",
      product: nil
    ))
  end

  it "renders the edit invoice form" do
    render

    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do

      assert_select "input[name=?]", "invoice[invoice_number]"

      assert_select "input[name=?]", "invoice[pen_number]"

      assert_select "input[name=?]", "invoice[quantity]"

      assert_select "input[name=?]", "invoice[tax_kdv]"

      assert_select "input[name=?]", "invoice[tax_otv]"

      assert_select "input[name=?]", "invoice[definition]"

      assert_select "input[name=?]", "invoice[sum]"

      assert_select "input[name=?]", "invoice[product_id]"
    end
  end
end
