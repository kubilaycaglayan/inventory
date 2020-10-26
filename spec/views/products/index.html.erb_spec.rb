require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        code: "Code",
        definition: "Definition"
      ),
      Product.create!(
        code: "Code",
        definition: "Definition"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "Code".to_s, count: 2
    assert_select "tr>td", text: "Definition".to_s, count: 2
  end
end
