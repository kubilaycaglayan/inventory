require 'rails_helper'

RSpec.describe 'products/new', type: :view do
  before(:each) do
    assign(:product, Product.new(
                       code: 'MyString',
                       definition: 'MyString'
                     ))
  end

  it 'renders new product form' do
    render

    assert_select 'form[action=?][method=?]', products_path, 'post' do
      assert_select 'input[name=?]', 'product[code]'

      assert_select 'input[name=?]', 'product[definition]'
    end
  end
end
