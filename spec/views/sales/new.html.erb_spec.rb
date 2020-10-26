require 'rails_helper'

RSpec.describe "sales/new", type: :view do
  before(:each) do
    assign(:sale, Sale.new(
      product: nil,
      return_amount: "9.99",
      buy_price: "9.99",
      sell_price: "9.99"
    ))
  end

  it "renders new sale form" do
    render

    assert_select "form[action=?][method=?]", sales_path, "post" do

      assert_select "input[name=?]", "sale[product_id]"

      assert_select "input[name=?]", "sale[return_amount]"

      assert_select "input[name=?]", "sale[buy_price]"

      assert_select "input[name=?]", "sale[sell_price]"
    end
  end
end
