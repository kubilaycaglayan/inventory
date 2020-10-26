require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      code: "MyString",
      definition: "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[code]"

      assert_select "input[name=?]", "product[definition]"
    end
  end
end
