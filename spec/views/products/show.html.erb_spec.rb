require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      code: "Code",
      definition: "Definition"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Definition/)
  end
end
